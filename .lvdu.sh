#!/bin/zsh

# Pasta padrão do libvirt
LIBVIRT_PATH="/var/lib/libvirt/images"

# Default update interval (in milliseconds)
UPDATE_INTERVAL=2000

# Check if custom interval is provided
if [[ "$1" == "/set" && -n "$2" && "$2" =~ '^[0-9]+$' ]]; then
    UPDATE_INTERVAL=$2
fi

# ANSI color codes
BLUE="\033[1;34m"
GREEN="\033[1;32m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# Function to display the panel
show_panel() {
    clear
    echo -e "${BLUE}=====================================${RESET}"
    echo -e "${CYAN}Libvirt QCOW2 Disk Usage Monitor${RESET}"
    echo -e "${BLUE}=====================================${RESET}"
    echo -e "${YELLOW}Update interval: ${UPDATE_INTERVAL}ms${RESET}"
    echo -e "${YELLOW}Path: ${LIBVIRT_PATH}${RESET}\n"
    
    for file in $LIBVIRT_PATH/*.qcow2; do
        if [[ -f "$file" ]]; then
            size=$(du -h "$file" | cut -f1)
            name=$(basename "$file")
            echo -e "${GREEN}${name}${RESET} -> ${size}"
        fi
    done
    echo -e "\n${BLUE}=====================================${RESET}"
    echo -e "${YELLOW}Last updated: $(date '+%Y-%m-%d %H:%M:%S')${RESET}"
}

# Trap Ctrl+C to exit cleanly
trap 'echo -e "\n${YELLOW}Exiting...${RESET}"; exit 0' INT

# Main loop
while true; do
    show_panel
    sleep $(echo "scale=3; $UPDATE_INTERVAL/1000" | bc)
done
