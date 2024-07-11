ARG SOURCE_IMAGE="silverblue"
ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="40"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-40}"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

COPY --from=ghcr.io/ublue-os/akmods-nvidia:fsync-40 /rpms /tmp/akmods-rpms

COPY build.sh /tmp/build.sh

RUN rpm-ostree cliwrap install-to-root / && \
    mkdir -p /var/lib/alternatives && \
    curl -Lo /etc/yum.repos.d/copr_fsync.repo https://copr.fedorainfracloud.org/coprs/sentry/kernel-fsync/repo/fedora-${SOURCE_TAG}/sentry-kernel-fsync-fedora-${SOURCE_TAG}.repo && \
    curl -Lo /tmp/nvidia-install.sh https://raw.githubusercontent.com/ublue-os/hwe/main/nvidia-install.sh && \
    chmod +x /tmp/nvidia-install.sh && \
    FEDORA_MAJOR_VERSION=40 IMAGE_NAME="main" RPMFUSION_MIRROR="" /tmp/nvidia-install.sh && \
    rpm-ostree override replace --experimental --freeze --from repo='copr:copr.fedorainfracloud.org:sentry:kernel-fsync' kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra && \
#    rpm-ostree override replace --experimental --from repo='copr:copr.fedorainfracloud.org:sentry:kernel-fsync' kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra kernel-uki-virt kernel-devel-matched && \
    rpm-ostree install kernel-headers && \
    /tmp/build.sh && \
    ostree container commit
