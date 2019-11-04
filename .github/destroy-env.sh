#!/bin/bash

env_name=$1
authorized_env_prefix='acme-clothing'

cleanup_bl() {
    bl line rm "$env_name" -w acme-corp
}

if [ -z "$env_name" ]; then
    echo "Usage: $0 environment_name"
    exit 1
fi

if ! [[ "$env_name" =~ ^${authorized_env_prefix}.*$ ]]; then
    echo "Cannot destroy this environment (protected)"
    exit 1
fi

if [ "$CONFIRM_DESTROY" != yes ]; then
    read -r -p "Please confirm you want to destroy \"${env_name}\"? [y/N] " response
    if ! [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
        echo "Abort."
        exit 1
    fi
fi

set -xu

cleanup_bl
