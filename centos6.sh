#!/usr/bin/env bash
# This bootstraps Puppet on CentOS 6.x
# It has been tested on CentOS 6.4 64bit

set -e

REPO_URL="https://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm"

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed."
  exit 0
fi

# Install puppet labs repo
echo -n "Adding puppetlabs yum repo..."
rpm -ivh ${REPO_URL} >/dev/null 2>&1
echo "done"

# Install Puppet...
echo -n "Installing puppet..."
yum install -y puppet >/dev/null 2>&1
echo "done"

# name resolution
ip=$(ifconfig eth0 | perl -ne 'if (/inet addr:(?<ip>.+?)\s+/){print $+{ip}}')
if [[ $(grep -c $(hostname) /etc/hosts) -eq 0 ]]; then
    echo "${ip} $(hostname) puppet" >> /etc/hosts
fi

