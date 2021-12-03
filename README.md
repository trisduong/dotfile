<H1>Hello archer</H1>

Download iso to make bootable usb: http://mirror.bizflycloud.vn/archlinux/iso/2021.12.01/

Use `iwctl` to connect wifi

Partition the disks with fdisk: `fdisk -l`, `fdisk /dev/the_disk_to_be_partitioned`

Format the partitions: `mkfs.ext4 /dev/root_partition`, `mkswap /dev/swap_partition`, `mkfs.fat -F 32 /dev/efi_system_partition`

Mount the file systems: `mount /dev/root_partition /mnt`, `mount /dev/efi_system_partition /mnt/boot`, `swapon /dev/swap_partition`

Install essential packages: pacstrap /mnt base linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Region/City /etc/localtime

hwclock --systohc

locale-gen

sudo vim /etc/locale.conf --> uncomment LANG=en_US.UTF-8

Set hostname: sudo vim /etc/hostname

Initramfs: mkinitcpio -P

passwd

Install grub --> Legacy: `grub-install --target=i386-pc /dev/sdX` --> UEFI: pacman -S grub efibootmgr --> mount EFI to /boot/EFI --> `grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB`

`grub-mkconfig -o /boot/grub/grub.cfg`

`pacman -S os-prober` --> vim `/etc/default/grub` --> `GRUB_DISABLE_OS_PROBER=false`

exit --> umount -R /mnt --> reboot

<H2>Install recommend package:</H2>

**Font:**
```
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
  
```

**Xorg**
```
sudo pacman -S xorg-server xorg-apps xorg-xinit
  
```

**Audio**
```
sudo pacman -S alsa alsa-utils alsa-plugins alsa-lib pavucontrol
  
```

**Add user**
```
useradd -m -g wheel tris
  
```

**Install yay***
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -Syyuu
  
```


> nvidia
```
pms nvidia nvidia-utils nvidia-settings xorg-server-devel opencl-nvidia 
```

> check disable nouveau
```
cat /usr/lib/modprobe.d/nvidia.conf
```

> etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf
```
Section "OutputClass"
    Identifier "intel"
    MatchDriver "i915"
    Driver "modesetting"
EndSection

Section "OutputClass"
    Identifier "nvidia"
    MatchDriver "nvidia-drm"
    Driver "nvidia"
    Option "AllowEmptyInitialConfiguration"
    Option "PrimaryGPU" "yes"
    ModulePath "/usr/lib/nvidia/xorg"
    ModulePath "/usr/lib/xorg/modules"
EndSection
```

> .xinitrc
```
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
```
> check 3D
```
glxinfo | grep NVIDIA
```



