#!/bin/sh

die() {
    case $? in
	0)
	    exitval=1
	    ;;
	*)
	    exitval=$?
            ;;
    esac

    printf '%s: %s\n' "${0##*/}" "$*" >&2

    exit "${exitval}"
}

provision_ansible_user() {
    if ! pveum user list | grep -qx 'ansible@pve'; then
        pveum user add ansible@pve \
            || die "failed to create ansible user"
    fi

    pveum aclmod / \
        -user ansible@pve \
        -role Administrator \
        || die "failed to grant Administrator role"

    if ! pveum user token list ansible@pve | grep -q 'ansible'; then
        pveum user token add ansible@pve ansible --output-format json \
            || die "failed to create API token"
    fi
}
