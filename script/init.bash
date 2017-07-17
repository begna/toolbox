#!/bin/bash

APT='apt'
USER=$(logname)
FLAG="/home/"$USER"/.toolbox"


#set -o verbose



function checkroot
{
   if [ "$(whoami)" != "root" ]; then
      echo "Sorry, you are not root."
      echo ""
      exit 1
   else
      echo "You've got the powah!"
	   echo ""
   fi
}

checkroot


# Check if the script was already launched
if [ -e $FLAG ]; then
  echo "Script already lunched."
  exit 1
fi





#########
# START #
#########

PS3='Select: '
options=("basic" "standard-ubuntu" "standard-raspbian" "QUIT")
select opt in "${options[@]}"
do
   case $opt in
         "basic")
            echo "-- basic --"
            echo ""
            break
            ;;
         "standard-ubuntu")
            echo "-- standard ubuntu --"
            echo ""
            break
            ;;
         "standard-raspbian")
            echo "-- standard raspbian --"
            echo ""
            break
            ;;
         "QUIT")
            echo "bye."
            echo ""
            exit 0
            ;;
         *)
            echo "Not a valid option"
            ;;
   esac
done





echo ""
echo "***************"
echo "* init script *"
echo "***************"
echo ""

# bash terminal
LINE="source ~/toolbox/toolbox.bash"
FILE="/home/"$USER"/.bashrc"

grep -q "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/g" "$FILE"


#################
# APT-GET basic #
#################

$APT update
$APT dist-upgrade -y

$APT install -y  byobu
$APT install -y  htop
$APT install -y  build-essential
$APT install -y  ghex
$APT install -y  bmon
$APT install -y  git
$APT install -y  nmap
$APT install -y  checkinstall debfoster deborphan cruft # http://guide.debianizzati.org/index.php/Pulire_Debian
$APT install -y  lynx
$APT install -y  mediainfo

####################
# APT-GET raspbian #
####################

if [ $opt == "standard-raspbian" ]
   then
  	$APT install -y  shellinabox 
	$APT install -y  transmission-daemon
fi






# Desktop GUI
#$APT install -y  gnome-session-fallback
#$APT install -y  gnome-shell
#$APT install -y  twm
#$APT install -y  fluxbox

# Terminal
#$APT install -y  tmux

# Wallpaper
#$APT install -y  edgy-wallpapers			   # 6.10
#$APT install -y  feisty-wallpapers			   # 7.04
#$APT install -y  gutsy-wallpapers			   # 7.10
#$APT install -y  ubuntu-wallpapers* # 9.10 -> ?

# Applet
#$APT install -y  indicator-applet
#$APT install -y  indicator-multiload
#$APT install -y  netspeed

# Dev
#$APT install -y  gedit
#$APT install -y  geany
#$APT install -y  codeblocks
#$APT install -y  meld
#$APT install -y  eclipse
#$APT install -y  mercurial

# Networking
#$APT install -y  filezilla
#$APT install -y  openssh-server
#$APT install -y  openssh-client
#$APT install -y  samba
#$APT install -y  smbfs

# Networking monitor tool
#$APT install -y  ifstat
#$APT install -y  zenmap

# Internet browser
#$APT install -y  chromium-browser
#$APT install -y  google-chrome-stable
#$APT install -y  flashplugin-installer

# Audio
#$APT install -y  tagtool
#$APT install -y  decibel-audio-player
#$APT install -y  audacity
#$APT install -y  beep

# Video
#$APT install -y  avidemux
#$APT install -y  vlc
#$APT install -y  ffmpeg

# Pictures
#$APT install -y  nautilus-image-converter 
#$APT install -y  gthumb
#$APT install -y  gimp

# Office
#$APT install -y  pdfshuffler 
#$APT install -y  libreoffice-pdfimport

# Others
#$APT install -y  beneath-a-steel-sky
#$APT install -y  scummvm

# Emulators 
#$APT install -y  dosbox
#$APT install -y  wine

# Apt-get stuff
#$APT install -y  gui-apt-key
#
# System monitor tool
#
#$APT install -y  hardinfo
#$APT install -y  smartmontools


# System 
#$APT install -y  gprename
#$APT install -y  glmark2
#$APT install -y  xauth
#$APT install -y  p7zip-full
#$APT install -y  unrar
#$APT install -y  gparted
#$APT install -y  gnome-commander
#$APT install -y  gnome-search-tool
#$APT install -y  virtualbox-fuse
#$APT install -y  cryptsetup-bin
#$APT install -y  nemo
#$APT install -y  compizconfig-settings-manager

#$APT install -y  ubuntu-restricted-addons
#$APT install -y  ubuntu-restricted-extras 








#################################
# APT-GET AUTOCLEAN - AUTOCLEAN #
#################################

$APT autoclean -y
$APT autoremove -y


#######
# MOO #
#######

$APT moo



touch $FLAG
chown $USER $FLAG
