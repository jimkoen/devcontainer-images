# FROM todo: add new image link 
LABEL description="Ansible devcontainer image (Almalinux)"
USER root

# Install tools

RUN dnf makecache --refresh \
    && dnf -y install \
    bind-utils \
    util-linux-user \
    git \
    sudo \
    vim \
    wget \
    unzip \
    tar \
    jq \
    python \
    python-pip 

# Install Ansible
RUN dnf makecache --refresh \
    && dnf -y install epel-release \
    && dnf -y install ansible
#Comment####
# Install antsibull dependencies
RUN pip install --upgrade pip \
    && pip install setuptools wheel \
    && pip install --ignore-installed antsibull-docs hcloud ansible-lint jmespath dnspython

# Install Ansible modules
USER vscode
RUN ansible-galaxy collection install community.general hetzner.hcloud community.dns felixfontein.acme
