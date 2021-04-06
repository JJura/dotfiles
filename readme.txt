================================================================================
1. Packages:
================================================================================
- sudo
- neovim
- locales
- linux-image-amd64
- systemd-sysv
- xserver-xorg-core
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

================================================================================
2. Network config:
================================================================================
- /etc/systemd/network/21-wireless.network:
[Match]
Name=wlp2s0b1

[Network]
DHCP=yes

- /etc/wpa_supplicant/wpa_supplicant-wlp2s0b1.conf:
# wpa_passphrase "SSID" "password" > /etc/wpa_supplicant/wpa_supplicant-wlp2s0b1.conf

- Enable services:
# systemctl enable systemd-networkd
# systemctl enable wpa_supplicant@wlp2s0b1

================================================================================
3. User groups:
================================================================================
# usermod -aG sudo lucas
# usermod -aG audio lucas
# usermod -aG video lucas
# usermod -aG input lucas

================================================================================
4. Audio config:
================================================================================
- /etc/modprobe.d/alsa-base.conf:
options snd_hda_intel id=PCH,HDMI index=1,0

================================================================================
5. Touchpad config:
================================================================================
- /etc/X11/xorg.conf.d/30-touchpad.conf:
Section "InputClass"
        Identifier "touchpad"
        Driver "libinput"
        MatchIsTouchpad "on"
        Option "NaturalScrolling" "on"
        Option "Tapping" "on"
        Option "TappingButtonMap" "lmr"
EndSection

================================================================================
6. Configure date and timezone
================================================================================
# dpkg-reconfigure locales
# dpkg-reconfigure tzdata

================================================================================
7. Bootloader
================================================================================
# grub-install /dev/sda
# grub-mkconfig -o /boot/grub/grub.cfg

================================================================================
8. Build dwm, dmenu
================================================================================
$ make XINERAMALIBS="" XINERAMAFLAGS=""

================================================================================
9. Backlight
================================================================================
- /etc/udev/rules.d/backlight.rules:
ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", RUN+="/usr/bin/chgrp video /sys/class/backlight/intel_backlight/brightness"
ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", RUN+="/usr/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"
