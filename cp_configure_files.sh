#/bin/bash
cp config_files/.bashrc  ~
cp config_files/.config  ~
cp config_files/.git-prompt.sh  ~
cp config_files/.gvimrc  ~
cp config_files/.inputrc  ~
cp config_files/.tmux.conf  ~
cp config_files/.vimrc  ~
cp config_files/.ycm_extra_conf.py  ~

if [[ -d "~/catkin_ws" ]]; then
  cp config_files/.ycm_extra_conf_ros.py  ~/catkin_ws
else
  if [[ -d "/opt/ros/" ]]; then
    mkdir -p ~/catkin_ws
    cp config_files/.ycm_extra_conf_ros.py  ~/catkin_ws
  else
    echo "Didn't find ROS, so not compying YCM config file in catkin_ws"
  fi
fi

mkdir -p ~/.config/vimfx
cp ./config_files/.config/vimfx/*.js ~/.config/vimfx/
echo "Remember to update config file path in firefox about:config for VimFx"
