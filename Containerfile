## If someone other than me manages to see this, I am so sorry if this script hurts to look at. I am in no way, shape or form a programmer of any kind, I am only attempting to create an OS tailored to my needs.
## 1. BUILD ARGS
# These allow changing the produced image by passing different build args to adjust
# the source from which your image is built.
# Build args can be provided on the commandline when building locally with:
#   podman build -f Containerfile --build-arg FEDORA_VERSION=40 -t local-image

# Install kernel-fsync
COPY --from=fsync /tmp/rpms /tmp/fsync-rpms
RUN rpm-ostree cliwrap install-to-root / && \
    if [[ "${KERNEL_FLAVOR}" =~ "fsync" ]]; then \
        echo "Will install ${KERNEL_FLAVOR} kernel" && \
        rpm-ostree override replace \
        --experimental \
            /tmp/fsync-rpms/kernel-6*.rpm \
            /tmp/fsync-rpms/kernel-core-*.rpm \
            /tmp/fsync-rpms/kernel-modules-*.rpm \
            /tmp/fsync-rpms/kernel-uki-virt-*.rpm \
    ; else \
        echo "will use kernel from ${KERNEL_FLAVOR} images" \
    ; fi && \
    ostree container commit

# Install desired packages
RUN rpm-ostree install \
        neofetch \
        grub-customizer \
        gnome-tweaks \
    ostree container commit

# SOURCE_IMAGE arg can be anything from ublue upstream which matches your desired version:
# See list here: https://github.com/orgs/ublue-os/packages?repo_name=main
# - "silverblue"
# - "kinoite"
# - "sericea"
# - "onyx"
# - "lazurite"
# - "vauxite"
# - "base"
#
#  "aurora", "bazzite", "bluefin" or "ucore" may also be used but have different suffixes.
ARG SOURCE_IMAGE="silverblue"

## SOURCE_SUFFIX arg should include a hyphen and the appropriate suffix name
# These examples all work for silverblue/kinoite/sericea/onyx/lazurite/vauxite/base
# - "-main"
# - "-nvidia"
# - "-asus"
# - "-asus-nvidia"
# - "-surface"
# - "-surface-nvidia"
#
# aurora, bazzite and bluefin each have unique suffixes. Please check the specific image.
# ucore has the following possible suffixes
# - stable
# - stable-nvidia
# - stable-zfs
# - stable-nvidia-zfs
# - (and the above with testing rather than stable)
ARG SOURCE_SUFFIX="-asus-nvidia"

## SOURCE_TAG arg must be a version built for the specific image: eg, 39, 40, gts, latest
ARG SOURCE_TAG="latest"


### 2. SOURCE IMAGE
## this is a standard Containerfile FROM using the build ARGs above to select the right upstream image
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}


### 3. MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
## NOTES:
# - /var/lib/alternatives is required to prevent failure with some RPM installs
# - All RUN commands must end with ostree container commit
#   see: https://coreos.github.io/rpm-ostree/container/#using-ostree-container-commit
