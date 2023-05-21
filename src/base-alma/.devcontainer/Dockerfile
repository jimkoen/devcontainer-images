# Adapted from:https://github.com/devcontainers/images/blob/0cd0769b0254cc3fb4714bbbb09065080064d20c/src/cpp/.devcontainer/Dockerfile
FROM almalinux:9
LABEL description="base-alma devcontainer image (Almalinux)"
USER root

# Basic tool installation

RUN dnf makecache --refresh && dnf -y install util-linux-user sudo wget zsh git make