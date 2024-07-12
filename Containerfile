ARG SOURCE_IMAGE="silverblue"
ARG SOURCE_SUFFIX="-asus"
ARG SOURCE_TAG="40"
FROM ghcr.io/ublue-os/fsync-kernel:40-6.9.8
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

# Install kernel-fsync
COPY --from=fsync-kernel /tmp/rpms /tmp/fsync-rpms
RUN rpm-ostree cliwrap install-to-root / && \
    rpm-ostree override replace \
    --experimental \
        /tmp/fsync-rpms/kernel-[0-9]*.rpm \
        /tmp/fsync-rpms/kernel-core-*.rpm \
        /tmp/fsync-rpms/kernel-modules-*.rpm \
        /tmp/fsync-rpms/kernel-uki-virt-*.rpm && \
    ostree container commit

# Install Nvidia driver
COPY --from=ghcr.io/ublue-os/akmods-nvidia:fsync-40 /rpms /tmp/akmods-rpms
COPY build.sh /tmp/build.sh
RUN rpm-ostree cliwrap install-to-root / && \
    mkdir -p /var/lib/alternatives && \
    curl -Lo /tmp/nvidia-install.sh https://raw.githubusercontent.com/ublue-os/hwe/main/nvidia-install.sh && \
    chmod +x /tmp/nvidia-install.sh && \
    FEDORA_MAJOR_VERSION=40 IMAGE_NAME="asus" RPMFUSION_MIRROR="" /tmp/nvidia-install.sh && \
    /tmp/build.sh && \
    ostree container commit
