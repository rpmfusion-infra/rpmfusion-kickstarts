# Maintained by RPM Fusion:
# http://rpmfusion.org
# mailto:rpmfusion-developers@lists.rpmfusion.org

%include /usr/share/spin-kickstarts/fedora-live-base.ks
%include /usr/share/rpmfusion-free-remix-kickstarts/rpmfusion-free-live-base.ks
#include /usr/share/rpmfusion-free-remix-kickstarts/rpmfusion-free-tainted.ks
%include /usr/share/rpmfusion-nonfree-remix-kickstarts/rpmfusion-nonfree-live-base.ks
#include /usr/share/rpmfusion-nonfree-remix-kickstarts/rpmfusion-nonfree-tainted.ks

repo --name=rpmfusion-free-tainted --mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-tainted-$releasever&arch=$basearch
repo --name=rpmfusion-nonfree-tainted --mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-tainted-$releasever&arch=$basearch


services --disabled="network" --enabled="sshd,NetworkManager,ModemManager"
part / --fstype="ext4" --size=8192

%packages
# Release
rpmfusion-free-release
rpmfusion-nonfree-release

# Groups
-@dial-up
-@input-methods
-@standard
@base-x
@core
@firefox
@fonts
@guest-desktop-agents
@hardware-support
@multimedia
@networkmanager-submodules
@printing

# from server
@headless-management
@domain-client
# Also relevant
@smb-server
@mysql
@web-server


# Packages
## From Fedora
initial-setup
initial-setup-gui
dvb-apps
libva-utils
libva-vdpau-driver
libvdpau-va-gl
lightdm-qt5
mesa-vdpau-drivers
v4l-utils
vdpauinfo
w_scan
## Excluded from Fedora
-gfs2-utils
-reiserfs-utils

## From RPM Fusion - Free
chromium-freeworld
comskip
ffmpeg
fuse-exfat
get-flash-videos
get_iplayer
gstreamer1-libav
gstreamer1-plugins-bad-freeworld
gstreamer1-plugins-ugly
h264enc
kodi
kodi-platform
kodi-inputstream-adaptive
kodi-pvr-hts
kodi-pvr-iptvsimple
kodi-pvr-mythtv
kodi-pvr-vdr-vnsi
kodi-pvr-argustv
kodi-pvr-demo
kodi-pvr-dvblink
kodi-pvr-dvbviewer
kodi-pvr-filmon
kodi-pvr-mediaportal-tvserver
kodi-pvr-nextpvr
kodi-pvr-njoy
kodi-pvr-pctv
kodi-pvr-stalker
kodi-pvr-vbox
kodi-pvr-vuplus
kodi-pvr-wmc
kodi-peripheral-joystick
libva-intel-hybrid-driver
libva-intel-driver
mpd
mpv
mythgame
mythmusic
mythnetvision
mythtv
mythtv-status
mythweb
mythzoneminder
python-vlc
qt5-qtwebengine-freeworld
tvheadend
vdr-burn
vdr-markad
vdr-mp3
vdr-remote
vdr-skindesigner
vdr-softhddevice
vdrsync
vdr-mpv
vdr-tvguideng
vdr-weatherforecast
vdr-plex
#vdr-softhddevice-openglosd
vlc
xmltv
xmltv-grabbers
x264
x265
zoneminder

## From RPM Fusion - NonFree
fdkaac
gstreamer1-plugins-bad-nonfree
intel-media-driver
unrar

## From RPM Fusion - Free - Tained
rpmfusion-free-release-tainted
libdvdcss

## From RPM Fusion - NonFree - Tainted
rpmfusion-nonfree-release-tainted
b43-firmware
broadcom-bt-firmware
dvb-firmware
nouveau-firmware

%end

%post
# set up auto-login
cat > /etc/lightdm/lightdm.conf.d/50-autologin.conf<<EOF
[Seat:*]
type=local
autologin-user=liveuser
autologin-user-timeout=0
autologin-session=kodi
EOF

systemctl set-default graphical.target
systemctl enable cockpit.socket
%end
