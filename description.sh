#!/bin/bash

# SYSTEM INFORMATION
echo "SYSTEM"
echo "Hostname: $(hostname)"
echo "Manufacturer: $(dmidecode -s system-manufacturer)"
echo "Product name: $(dmidecode -s system-product-name)"
echo "Version: $(dmidecode -s bios-version)"
echo "Serial number: $(dmidecode -s system-serial-number)"
echo "Operating system: $(grep 'PRETTY_NAME' /etc/os-release | cut -d'=' -f2 | tr -d '\"')"
echo "Kernel: $(uname -r)"
echo "Architecture: $(uname -m)"

# PRIVATE NETWORK INFORMATION
echo -e "\nPRIVATE NETWORK INFORMATION"
ip -4 addr show | awk '/inet/ {print $2, $NF}' | grep -v '127.0.0.1'
ip -6 addr show | awk '/inet6/ {print $2, $NF}' | grep -v '::1/128'

# PUBLIC IP ADDRESS
echo -e "\nPUBLIC IP ADDR"
public_ip=$(curl -s http://ipecho.net/plain)
echo "$public_ip"

# DNS INFORMATION
echo -e "\nDNS"
cat /etc/resolv.conf | grep 'nameserver'

# CPU USAGE INFORMATION
echo -e "\nCPU USAGE"
echo "Model name: $(lscpu | grep 'Model name' | cut -d':' -f2 | sed 's/^[ \t]*//')"
echo "CPU frequency: $(lscpu | grep 'CPU MHz' | cut -d':' -f2 | sed 's/^[ \t]*//') MHz"
echo "CPU cores: $(lscpu | grep '^CPU(s):' | cut -d':' -f2 | sed 's/^[ \t]*//')"

# DISK SPACE INFORMATION
echo -e "\nDISK SPACE INFO"
echo "Free space /home: $(df -h /home | awk '$NF=="/home"{print $4}')"
echo "Free space /tmp: $(df -h /tmp | awk '$NF=="/tmp"{print $4}')"

exit 0
