FROM rockylinux/rockylinux:10 

# 1. Paquetes de sistema (agregamos sudo)
RUN dnf install -y \
    python3 \
    python3-pip \
    openssh-clients \
    git \
    sshpass \
    iproute \
    sudo \
    && dnf clean all

# 2. Dependencias Python (ansible-core, docker SDK, netaddr, jmespath)
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

# 3. Collections de Ansible
COPY collections.yml /tmp/collections.yml
RUN ansible-galaxy collection install -r /tmp/collections.yml

# 4. Usuario no-root con sudo full
RUN useradd -m -s /bin/bash adminserver \
    && echo "adminserver ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/adminserver \
    && mkdir -p /ansible \
    && chown adminserver:adminserver /ansible

USER adminserver
WORKDIR /ansible

CMD ["/bin/bash"]
