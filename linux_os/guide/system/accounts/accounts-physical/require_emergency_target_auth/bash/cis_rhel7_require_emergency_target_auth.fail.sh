#!/bin/bash
#
# platform = Red Hat Enterprise Linux 7
# profiles = xccdf_org.ssgproject.content_profile_cis

service_file="/usr/lib/systemd/system/emergency.service"

sulogin='/bin/sh -c "/sbin/sulogin; /usr/bin/systemctl --fail --no-block default"'

if grep "^ExecStart=.*" "$service_file" ; then
    sed -i "s%^ExecStart=.*%ExecStart=-$sulogin%" "$service_file"
else
    echo "ExecStart=-$sulogin" >> "$service_file"
fi
