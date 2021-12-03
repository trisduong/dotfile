#Hello archer
1. Download iso to make bootable usb: http://mirror.bizflycloud.vn/archlinux/iso/2021.12.01/
2. Use `iwctl` to connect wifi
3. Partition the disks with fdisk: `fdisk -l`, `fdisk /dev/the_disk_to_be_partitioned`
4. Format the partitions: `mkfs.ext4 /dev/root_partition`, `mkswap /dev/swap_partition`, `mkfs.fat -F 32 /dev/efi_system_partition`
5. Mount the file systems: `mount /dev/root_partition /mnt`, `mount /dev/efi_system_partition /mnt/boot`, `swapon /dev/swap_partition`
6. Install essential packages: pacstrap /mnt base linux linux-firmware
7. genfstab -U /mnt >> /mnt/etc/fstab
8. arch-chroot /mnt
9. ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
10. hwclock --systohc
11. locale-gen
12. sudo vim /etc/locale.conf --> uncomment LANG=en_US.UTF-8
13. Set hostname: sudo vim /etc/hostname
14. Initramfs: mkinitcpio -P
15. passwd
16. Install grub --> Legacy: `grub-install --target=i386-pc /dev/sdX` --> UEFI: pacman -S grub efibootmgr --> mount EFI to /boot/EFI --> `grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB`
17. `grub-mkconfig -o /boot/grub/grub.cfg`
18. `pacman -S os-prober` --> vim `/etc/default/grub` --> `GRUB_DISABLE_OS_PROBER=false`
19.exit --> umount -R /mnt --> reboot

#Install recommend package:

Font: ***mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf***

***sudo pacman -S xorg-server xorg-apps xorg-xinit***

***sudo pacman -S alsa alsa-utils alsa-plugins alsa-lib pavucontrol***

***useradd -m -g wheel tris***

***git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -Syyuu
***



