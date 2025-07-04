
# LVDU - Libvirt QCOW2 Disk Usage Monitor

A Bash/Zsh script to monitor QCOW2 disk usage for your Libvirt virtual machines.  
It displays a live panel of disk names and sizes, refreshing at a configurable interval.

---

## Features

- Monitors all `.qcow2` files in `/var/lib/libvirt/images`
- Clear and colored terminal output
- Configurable update interval (milliseconds)

---

## Clone the Repository

```bash
git clone https://github.com/Hrafngud/LVDU.git
````

---

## Install the Script

Copy the script to your scripts folder and make it executable:

```bash
mkdir -p ~/scripts
cp path-to-cloned-repo/your-script.sh ~/scripts/lvdu.sh
chmod +x ~/scripts/lvdu.sh
```

---

## Create an Alias

Add an alias for easy use.

### Zsh

```bash
echo 'alias lvdu="~/scripts/lvdu.sh"' >> ~/.zshrc
source ~/.zshrc
```

### Bash

```bash
echo 'alias lvdu="~/scripts/lvdu.sh"' >> ~/.bashrc
source ~/.bashrc
```

---

## Usage

Run with default update interval:

```bash
lvdu
```

Run with custom update interval (e.g., 5000 ms):

```bash
lvdu /set 5000
```

---

## Requirements

* `bash` or `zsh`
* `du`
* `bc`
* `libvirt` with virtual machines using `.qcow2` disks

---

## Notes

* The script assumes disk images are located in `/var/lib/libvirt/images`.
  You can edit the `LIBVIRT_PATH` variable in the script to change this location.
* Press `Ctrl+C` to exit cleanly.

```
