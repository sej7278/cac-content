#!/bin/bash
# packages = authselect
# platform = Oracle Linux 8,Oracle Linux 9,Red Hat Enterprise Linux 8,Red Hat Enterprise Linux 9,multi_platform_fedora
# variables = var_password_hashing_algorithm_pam=sha512

authselect create-profile hardening -b sssd
CUSTOM_PROFILE="custom/hardening"
authselect select $CUSTOM_PROFILE --force
CUSTOM_SYSTEM_AUTH="/etc/authselect/$CUSTOM_PROFILE/system-auth"
if ! $(grep -q "^password.*sufficient.*pam_unix\.so.*sha512" "$CUSTOM_SYSTEM_AUTH"); then
    sed -i --follow-symlinks '/^password.*sufficient.*pam_unix\.so/ s/$/ sha512/' "$CUSTOM_SYSTEM_AUTH"
fi
sed -i --follow-symlinks '/^password.*sufficient.*pam_unix\.so/ s/$/ yescrypt/' "$CUSTOM_SYSTEM_AUTH"
authselect apply-changes -b
