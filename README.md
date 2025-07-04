LVDU - Libvirt QCOW2 Disk Usage Monitor

This is a simple Bash/Zsh script to monitor QCOW2 disk usage for your Libvirt virtual machines.
It displays a panel with disk names and sizes, refreshing at a customizable interval.
Features

    Monitors all .qcow2 files in /var/lib/libvirt/images

    Clear and colored terminal output

    Configurable update interval

Clone the Repository

To get started, clone the repository to your preferred location:

git clone https://your-repository-url.git

Replace your-repository-url.git with your actual repo URL.
Move the Script

We recommend placing the script inside your personal scripts directory, e.g.:

mkdir -p ~/scripts
cp path-to-cloned-repo/your-script.sh ~/scripts/lvdu.sh
chmod +x ~/scripts/lvdu.sh

Create an Alias

Add the following alias to your shell configuration file:
For Zsh

echo 'alias lvdu="~/scripts/lvdu.sh"' >> ~/.zshrc
source ~/.zshrc

For Bash

echo 'alias lvdu="~/scripts/lvdu.sh"' >> ~/.bashrc
source ~/.bashrc

Usage

Run the command:

lvdu

Optionally, specify a custom update interval in milliseconds:

lvdu /set 5000

This example updates the panel every 5 seconds.
Requirements

    bash or zsh

    du

    bc

    libvirt installed and virtual machines using .qcow2 disks

Notes

    The script assumes your disk images are located in /var/lib/libvirt/images. You can edit the script to change this path if needed.

    Use Ctrl+C to exit the monitor cleanly.

