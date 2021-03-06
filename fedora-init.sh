#!/bin/sh

# Are you root?
if [ "$(id -u)" != 0 ]; then
  echo "You should run this script directly as root."
fi

# Repos
dnf install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm
dnf install http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm
dnf copr enable nibbler/nodejs

dnf -y update

# Fonts
dnf -y install wqy*
dnf install -y cjkuni-ukai-fonts cjkuni-uming-fonts font-manager

# Gpaste Integration
dnf install gnome-shell-extension-gpaste -y

# Must
dnf -y install gnome-tweak-tool libreoffice-langpack-zh-Hant

# Editor
dnf install -y vim
wget https://atom.io/download/rpm /tmp/atom.rpm
dnf install -y /tmp/atom.rpm

# Dev
dnf install -y git tig
dnf group install "C Development Tools and Libraries"
dnf install -y eclipse
dnf install -y nodejs npm
npm install surge mocha gulp grunt -g
dnf install -y python3
dnf install -y ruby ruby-devel rubygems libxml2-devel
dnf install -y mariadb mariadb-devel sqlite sqlite-devel
gem install rails --no-ri --no-rdoc
gem install github-pages --no-ri --no-rdoc
gem install bundle --no-ri --no-rdoc
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p # FYI: https://github.com/guard/listen/wiki/Increasing-the-amount-of-inotify-watchers
dnf -y install codeblocks

dnf install -y compat-libstdc++-296.i686 compat-libstdc++-33.i686 compat-libstdc++-33.x86_64 zlib.i686 ncurses-libs.i686 # for android studio
dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm # google-chrome
dnf install -y audacity-nonfree transmission gimp inkscape mypaint

# Input Method
dnf install -y fcitx fcitx-table-chinese fcitx-configtool fcitx-qt4 fcitx-chewing im-chooser
gsettings set org.gnome.settings-daemon.plugins.keyboard active false
echo "export GTK_IM_MODULE=fcitx" >> /etc/profile
echo "export QT_IM_MODULE=fcitx" >> /etc/profile
echo "export XMODIFIERS="@im=fcitx"" >> /etc/profile
im-chooser

