#!/bin/bash
set -e

sudo -E /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring hazelcast --instance hc service start --init-system sysv
sudo -E /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring elasticsearch --instance es service start --init-system sysv
sudo -E /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs service start --init-system sysv

echo "ALL START"
sh