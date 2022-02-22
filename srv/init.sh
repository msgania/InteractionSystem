#!/bin/bash
set -e

sudo useradd csuser

sudo -E /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring hazelcast instance create --dir /var/cs/hc --owner csuser
sudo -E /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring hazelcast --instance hc service create --java-home /usr/lib/jvm/java-11-openjdk-amd64 --username csuser --stopped --init-system sysv

sudo -E /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring elasticsearch instance create --dir /var/cs/es --owner csuser
sudo -E /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring elasticsearch --instance es service create --java-home /usr/lib/jvm/java-11-openjdk-amd64 --username csuser --stopped --init-system sysv

sudo -E /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs instance create --dir /var/cs/cs --owner csuser
sudo -E /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs service create --java-home /usr/lib/jvm/java-11-openjdk-amd64 --username csuser --stopped --init-system sysv

sudo -E /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs jdbc pools --name common set-params --url jdbc:postgresql://db:5432/cs_db?currentSchema=public
sudo -E /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs jdbc pools --name common set-params --username postgres
sudo -E /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs jdbc pools --name common set-params --password postgres
sudo -E /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs jdbc pools --name privileged set-params --url jdbc:postgresql://db:5432/cs_db?currentSchema=public
sudo -E /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs jdbc pools --name privileged set-params --username postgres
sudo -E /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs jdbc pools --name privileged set-params --password postgres

sudo -E /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs websocket set-params --hostname cs
sudo -E /opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/ring cs --instance cs websocket set-params --port 8087
