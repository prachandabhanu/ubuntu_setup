#!/bin/bash

echo "[Update the package lists and upgrade them]"
sudo apt update
sudo apt upgrade -y
 

echo "[-------------------------------------------------------> ROS <--------------------------------------------------------]"
echo "[Add the ROS repository]"
if [ ! -e /etc/apt/sources.list.d/ros-latest.list ]; then
  sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
fi

echo "[Download the ROS keys]"
roskey=`apt-key list | grep "Open Robotics"`
if [ -z "$roskey" ]; then
  sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
fi

echo "[Check the ROS keys]"
roskey=`apt-key list | grep "Open Robotics"`
if [ -n "$roskey" ]; then
  echo "[ROS key exists in the list]"
else
  echo "[Failed to receive the ROS key, aborts the installation]"
  exit 0
fi

echo "[Update the package lists and upgrade them]"
sudo apt update -y
sudo apt upgrade -y

echo "[Install the ros-desktop-full]"
sudo apt install -y ros-noetic-desktop-full

echo "[Environment setup and getting rosinstall]"
source /opt/ros/noetic/setup.sh
sudo apt-get install python3-rosdep python3-rosinstall-generator python3-vcstool build-essential

echo "[Install Catkin tool]"
# sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
# wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
# sudo apt update
# sudo apt install -y python-catkin-tools
sudo apt install -y python3-catkin-lint python3-pip
pip3 install osrf-pycommon
sudo apt install -y python3-catkin-tools

sudo rosdep init
rosdep update
