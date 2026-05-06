FROM jamestalmage/proxmox-auto-install-assistant

WORKDIR /assistant

ENV PROXMOX_VERSION=9.1-1

COPY answer.toml .

RUN wget "https://enterprise.proxmox.com/iso/proxmox-ve_${PROXMOX_VERSION}.iso"

