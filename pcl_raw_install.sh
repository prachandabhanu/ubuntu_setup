#!/bin/bash

echo "[Update the package lists and upgrade them]"
sudo apt update
sudo apt upgrade -y

echo "[Create installation folder]"
mkdir -p ~/ros_ws/pcl_raw_install
cd ~/ros_ws/pcl_raw_install

sudo apt install -y git cmake cmake-curses-gui

wget -o eign-3.3.7.zip http://bitbucket.org/eigen/eigen/get/3.3.7.zip
wget -o flann-1.9.1.zip https://github.com/mariusmuja/flann/archive/1.9.1.zip
wget -o qhull-2019.1.tar.gz https://github.com/qhull/qhull/archive/2019.1.tar.gz
wget  https://github.com/PointCloudLibrary/pcl/archive/pcl-1.11.0.tar.gz
wget -o googletest-1.8.1.tar.gz https://github.com/google/googletest/archive/release-1.8.1.tar.gz
