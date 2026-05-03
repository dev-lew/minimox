FROM jamestalmage/proxmox-auto-install-assistant

ENV PROXMOX_VERSION=9.1-1

COPY answer.toml /assistant
