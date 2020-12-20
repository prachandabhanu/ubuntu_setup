#!/bin/bash

echo "[Update the package lists and upgrade them]"
sudo apt update
sudo apt upgrade -y

echo "[Create installation folder]"
mkdir ~/cuda_install
cd ~/cuda_install

echo "[Pre-installation]"
sudo apt-get install linux-headers-$(uname -r)

echo "[Install Cuda 10.2]"
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget http://developer.download.nvidia.com/compute/cuda/11.0.2/local_installers/cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-0-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda

echo "[Blacklist nouveau]"
if [ ! -e /etc/modprobe.d/blacklist-nouveau.conf ]; then
  sudo sh -c 'echo "blacklist nouveau" > /etc/modprobe.d/blacklist-nouveau.conf'
  sudo sh -c 'echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist-nouveau.conf'
fi
sudo update-initramfs -u

echo "[Path Setup]"
export PATH=/usr/local/cuda-11.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64\
                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda/lib64
sudo systemctl enable nvidia-persistenced

echo "[Dependency installation]"
sudo apt-get install -y g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev