================================================================================
1. Packages:
================================================================================
- sudo
- neovim
- locales
- linux-image-amd64
- systemd-sysv
- xserver-xorg-core
- xserver-xorg-legacy
- xserver-xorg-input-libinput
- x11-xserver-utils
- xinit
- grub2
- dbus
- wpasupplicant
- firmware-b43-installer
- alsa-utils
- libavcodec58
- libxft-dev
- intel-microcode
- git
- gcc
- make
- compton

================================================================================
2. Network config:
================================================================================
- Create config file
# wpa_passphrase "SSID" "password" > /etc/wpa_supplicant/wpa_supplicant-wlp2s0b1.conf

- Enable services:
# systemctl enable systemd-networkd
# systemctl enable wpa_supplicant@wlp2s0b1

================================================================================
3. User groups:
================================================================================
# usermod -aG sudo <user>
# usermod -aG audio <user>
# usermod -aG video <user>
# usermod -aG input <user>

================================================================================
4. Configure date and timezone
================================================================================
# dpkg-reconfigure locales
# dpkg-reconfigure tzdata

================================================================================
5. Bootloader
================================================================================
# grub-install /dev/sda
# grub-mkconfig -o /boot/grub/grub.cfg

================================================================================
6. Build dwm, dmenu
================================================================================
$ make XINERAMALIBS="" XINERAMAFLAGS=""
