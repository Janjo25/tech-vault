# QEMU/KVM and `virt-manager` Installation Guide on Arch Linux

## 1. Install the Full Version of QEMU

The `qemu-full` package provides support for emulating multiple architectures beyond `x86_64`.

```sh
sudo pacman -S qemu-full
```

**Optional packages that were excluded:**

- `qemu-user-static` (Not needed to run foreign architecture binaries directly on the host)
- `samba` (No need to share files between the host and VMs)

## 2. Install Packages for GUI Management

Install the necessary packages to manage VMs with a GUI.

```sh
sudo pacman -S libvirt dnsmasq iptables-nft swtpm
```

**Optional packages that were excluded:**

- `dmidecode` (Not needed to expose DMI/SMBIOS hardware details to the guest)
- `gettext` (Not needed for `libvirt-guests.service` to auto-start or suspend VMs)
- `libvirt-python` (Not needed for QMP proxy or SEV for encrypted virtualization)
- `libvirt-storage-gluster` (Not using GlusterFS for distributed storage)
- `libvirt-storage-iscsi-direct` (Not using direct iSCSI storage access, as VM disks will be stored locally)
- `lvm2` (Not using Logical Volume Manager for VM storage)
- `open-iscsi` (Not using iSCSI for remote storage access)
- `openbsd-netcat` (Not using remote management over SSH or TCP for libvirt)
- `python-cryptography` (Not using SEV validation for encrypted virtualization)
- `python-lxml` (Not using SEV validation for encrypted virtualization)
- `qemu-base` (Already included in `qemu-full`)
- `qemu-desktop` (Already included in `qemu-full`)
- `qemu-emulators-full` (Already included in `qemu-full`)
- `radvd` (Not using IPv6 router advertisement for guest networking)

## 3. Enable and Start the `libvirtd` Service

```sh
sudo systemctl start libvirtd.socket
sudo systemctl enable libvirtd.socket
```

## 4. Install the Virtual Machine Manager

`virt-manager` provides a graphical interface for managing VMs.

```sh
sudo pacman -S virt-manager
```

**Optional packages that were excluded:**

- `x11-ssh-askpass` (Not needed for password prompts in remote SSH connections)

## 5. Verify That `libvirt` is Working Properly

Run the following command to test if `libvirt` is functioning correctly:

```sh
virsh -c qemu:///system
```

## 6. Install UEFI Firmware for Virtual Machines

The `edk2-ovmf` package is needed to emulate UEFI firmware.

```sh
sudo pacman -S edk2-ovmf
```

## 7. Restart the `libvirtd` Service

```sh
sudo systemctl restart libvirtd
```

## 8. Add the Current User to the `libvirt` Group

To manage VMs without requiring root privileges, add the current user to the `libvirt` group:

```sh
sudo usermod -aG libvirt $USER
```

## Additional Notes

### VirtIO Windows Drivers

If running Windows VMs, download the VirtIO drivers from the official Fedora website to ensure correct detection of
virtualized hardware.

**Official Download Link:** [VirtIO Windows Drivers](https://fedorapeople.org/groups/virt/virtio-win/)
