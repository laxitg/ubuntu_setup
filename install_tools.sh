#system wide
sudo apt install -y apparix
sudo apt install -y audacity
sudo apt install -y build-essential
sudo apt install -y clang
sudo apt install -y clang-format
sudo apt install -y clementine
sudo apt install -y cmake
sudo apt install -y cmake-curses-gui
sudo apt install -y doxygen
sudo apt install -y exuberant-ctags
sudo apt install -y feh
sudo apt install -y ffmpeg
sudo apt install -y filezilla
sudo apt install -y freeglut3-dev
sudo apt install -y git
sudo apt install -y gitk
sudo apt install -y google-talkplugin
sudo apt install -y htop
sudo apt install -y mplayer
sudo apt install -y openssh-server
sudo apt install -y ros-kinetic-desktop
sudo apt install -y sl
sudo apt install -y slack-desktop
sudo apt install -y synaptic
sudo apt install -y tmux
sudo apt install -y vim-gnome-py2
sudo apt install -y vlc
sudo apt install -y clementine
sudo apt install -y synapse

#tmux manager
sudo apt install -y xclip
if [[ ! -d  "~/.tmux/plugins/tpm" ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "Didn't clone Tmux Plugin Manager (tpm)"
fi
