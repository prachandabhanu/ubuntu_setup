#!/bin/bash

echo "[Update the package lists and upgrade them]"
sudo apt update
sudo apt upgrade -y

echo "[-------------------------------------------------------> ROS2 <--------------------------------------------------------]"
echo "[Setup Locale]"
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

echo "[Setup Source]"
sudo apt update 
sudo apt install -y curl gnupg2 lsb-release
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
if [ ! -e /etc/apt/sources.list.d/ros2-latest.list ]; then
  sudo sh -c 'echo "deb http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'
fi

echo "[Install ROS 2 packages]"
sudo apt update
sudo apt install -y ros-foxy-desktop
source /opt/ros/foxy/setup.bash
sudo apt update
sudo apt install -y ros-foxy-rmw-opensplice-cpp
sudo apt install -y ros-foxy-rmw-connext-cpp