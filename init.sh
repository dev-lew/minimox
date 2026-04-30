#!/bin/sh

ISO_VERSION="9.1-1"

die() {
    case $? in
	0)
	    exitval=1
	    ;;
	*)
	    exitval=$?
    esac

    printf '%s: %s\n' "${0##*/}" "$*" >&2

    exit "${exitval}"
}

download_iso() {
    wget "https://enterprise.proxmox.com/iso/proxmox-ve_${ISO_VERSION}.iso" ||
        die "Failed to download Proxmox VE version ${ISO_VERSION}"
}
