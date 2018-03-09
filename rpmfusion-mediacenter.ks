# Maintained by RPM Fusion:
# http://rpmfusion.org
# mailto:rpmfusion-developers@lists.rpmfusion.org

%include /usr/share/spin-kickstarts/fedora-live-base.ks
%include /usr/share/spin-kickstarts/rpmfusion-free-live-base.ks
%include /usr/share/spin-kickstarts/rpmfusion-nonfree-live-base.ks

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
chromium
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
chromium-libs-media-freeworld
#comskip
ffmpeg
freetype-freeworld
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
unrar

%end

%post
# set up auto-login
cat > /etc/lightdm/lightdm.conf.d/50-autologin.conf<<EOF
[SeatDefaults]
autologin-user=liveuser
autologin-user-timeout=0
EOF

systemctl set-default graphical.target
%end
