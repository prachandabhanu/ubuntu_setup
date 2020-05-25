#!/bin/bash

echo "[Update the package lists and upgrade them]"
sudo apt update
sudo apt upgrade -y

echo "[This will remove the pcl 1.11.0 if installed through 'pcl_raw_install']"
echo "[Removal is neccessary if it is conficting with ROS]"

cd ~/ros_ws/pcl_raw_install

if [! -d "pcl" ]; then
  exit
fi

echo "[---------------------> pcl-1.11.1 <----------------------------]"
cd ~/ros_ws/pcl_raw_install/pcl
cd build
sudo make uninstall
cd ..
if [ -d "build" ]; then
  sudo rm -r build
fi

echo "[---------------------> qhull <----------------------------]"
cd ~/ros_ws/pcl_raw_install/qhull
cd build
sudo make uninstall
cd ..
if [ -d "build" ]; then
  sudo rm -r build
fi

echo "[---------------------> flann <----------------------------]"
cd ~/ros_ws/pcl_raw_install/flann
cd build
sudo make uninstall
cd ..
if [ -d "build" ]; then
  sudo rm -r build
fi

echo "[---------------------> Eigen <----------------------------]"
cd ~/ros_ws/pcl_raw_install/eigen
cd build
sudo make uninstall
cd ..
if [ -d "build" ]; then
  sudo rm -r build
fi