#!/bin/bash

# Check if the script is being run as root, and prompt the user to run with sudo if not
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run with sudo. Please run with 'sudo $0'"
    exit 1
fi

# Preserve sudo privileges across the whole script
sudo -v

# Check if fping, git, make, and gccgo-go are installed
if ! command -v fping &> /dev/null
then
    apt-get update
    apt-get install -y fping
fi

if ! command -v git &> /dev/null
then
    apt-get update
    apt-get install -y git
fi

if ! command -v make &> /dev/null
then
    apt-get update
    apt-get install -y make
fi

if ! command -v gccgo-go &> /dev/null
then
    apt-get update
    apt-get install -y gccgo-go
fi

# Clone the argus5 repository from GitHub and install
cd /tmp/
git clone https://github.com/jaw0/argus5.git
cd argus5/
sudo make install
sudo make install
