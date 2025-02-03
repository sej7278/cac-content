#!/bin/bash
# platform = multi_platform_ol,multi_platform_rhel,multi_platform_almalinux

{{% set dedicated_ssh_groupname = groups.get("dedicated_ssh_keyowner", {"name": "root"}).get("name") %}}

FAKE_KEY=$(mktemp -p /etc/ssh/ XXXX_key)
chown root:{{{ dedicated_ssh_groupname }}} "$FAKE_KEY"
chmod 0400 "$FAKE_KEY"

FAKE_KEY_ROOT=$(mktemp -p /etc/ssh/ XXXX_key)
chown root:root "$FAKE_KEY_ROOT"
chmod 0400 "$FAKE_KEY_ROOT"

