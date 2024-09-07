# Main arguments
ARG FEDORA_MAJOR_VERSION=40
ARG SOURCE_IMAGE="silverblue"
ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="${FEDORA_MAJOR_VERSION}"

# Import main packages
FROM ghcr.io/ublue-os/fsync-kernel:${FEDORA_MAJOR_VERSION}
FROM ghcr.io/ublue-os/akmods-nvidia:fsync-${FEDORA_MAJOR_VERSION}
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

COPY rootfs/ /

# Setup copr repos
RUN curl -Lo /usr/bin/copr https://raw.githubusercontent.com/ublue-os/COPR-command/main/copr && \
    chmod +x /usr/bin/copr && \
    curl -Lo /etc/yum.repos.d/_copr_fiftydinar-gnome-randr-rust.repo https://copr.fedorainfracloud.org/coprs/fiftydinar/gnome-randr-rust/repo/fedora-"${FEDORA_MAJOR_VERSION}"/fiftydinar-gnome-randr-rust-fedora-"${FEDORA_MAJOR_VERSION}".repo && \
    curl -Lo /etc/yum.repos.d/_copr_ublue-os-staging.repo https://copr.fedorainfracloud.org/coprs/ublue-os/staging/repo/fedora-"${FEDORA_MAJOR_VERSION}"/ublue-os-staging-fedora-"${FEDORA_MAJOR_VERSION}".repo && \
    ostree container commit

# Install kernel-fsync & LAVD
COPY --from=fsync-kernel /tmp/rpms /tmp/fsync-rpms
RUN rpm-ostree cliwrap install-to-root / && \
    rpm-ostree override replace \
    --experimental \
        /tmp/fsync-rpms/kernel-[0-9]*.rpm \
        /tmp/fsync-rpms/kernel-headers-*.rpm \
        /tmp/fsync-rpms/kernel-core-*.rpm \
        /tmp/fsync-rpms/kernel-modules-*.rpm \
        /tmp/fsync-rpms/kernel-uki-virt-*.rpm && \
    rpm-ostree install scx-cheds && \
    ostree container commit

# Install nvidia driver
COPY --from=akmods-nvidia /rpms /tmp/akmods-rpms
RUN curl -Lo /tmp/nvidia-install.sh https://raw.githubusercontent.com/ublue-os/hwe/main/nvidia-install.sh && \
    chmod +x /tmp/nvidia-install.sh && \
    FEDORA_MAJOR_VERSION=${FEDORA_MAJOR_VERSION} IMAGE_NAME="${SOURCE_IMAGE}${SOURCE_SUFFIX}" /tmp/nvidia-install.sh && \
    rm -f /usr/share/vulkan/icd.d/nouveau_icd.*.json && \
    ostree container commit

# Post install work
COPY build.sh /tmp/build.sh
RUN curl -Lo /usr/lib/sysctl.d/99-bore-scheduler.conf https://github.com/CachyOS/CachyOS-Settings/raw/master/usr/lib/sysctl.d/99-bore-scheduler.conf && \
    tmp/build.sh && \
    mkdir -p /var/lib/alternatives && \
    systemctl enable performance.service && \
    ostree container commit

# Install custom themes/extensions
COPY extensions.sh /tmp/extensions.sh
RUN chmod +x /tmp/extensions.sh && \
    /tmp/extensions.sh && \
    rpm-ostree install adw-gtk3-theme && \
    systemctl enable dconf-update.service && \
    ostree container commit

# Add extra packages
RUN rpm-ostree install \
    gnome-randr-rust \
    neofetch \
    grub-customizer \
#    logiops \
    gnome-tweaks \
    distrobox \
    yt-dlp \
    svt-av1 \
    svt-vp9 \
    gstreamer1-vaapi \
    solaar \
    zlib \
    xcb-util-cursor \
    i2c-tools && \
    rpm-ostree override replace \
    --experimental \
    --from repo=updates \
        gstreamer1 \
        gstreamer1-plugins-base \
        || true && \
    ostree container commit
# RUN systemctl enable logid.service
