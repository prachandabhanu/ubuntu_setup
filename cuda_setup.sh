# #!/bin/bash

# echo "[Update the package lists and upgrade them]"
# sudo apt update
# sudo apt upgrade -y

# echo "[Create installation folder]"
# mkdir ~/cuda_install
# cd ~/cuda_install

# echo "[Pre-installation]"
# sudo apt-get install linux-headers-$(uname -r)

# echo "[Install Cuda 10.2]"
# wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
# sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
# wget http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
# sudo dpkg -i cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
# sudo apt-key add /var/cuda-repo-10-2-local-10.2.89-440.33.01/7fa2af80.pub
# sudo apt-get update
# sudo apt-get -y install cuda

# echo "[Blacklist nouveau]"
# if [ ! -e /etc/modprobe.d/blacklist-nouveau.conf ]; then
#   sudo sh -c 'echo "blacklist nouveau" > /etc/modprobe.d/blacklist-nouveau.conf'
#   sudo sh -c 'echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist-nouveau.conf'
# fi
# sudo update-initramfs -u

# echo "[Path Setup]"
# sudo sh -c 'echo "export PATH=$PATH:/usr/local/cuda-10.2/bin:/usr/local/cuda-10.2/NsightCompute-2019.1${PATH:+:${PATH}}" > /etc/profile.d/cuda.conf'
# sudo sh -c 'echo "export CUDADIR=/usr/local/cuda-10.2" >> /etc/profile.d/cuda.conf'
# sudo chmod +x /etc/profile.d/cuda.conf
# sudo ldconfig
# export PATH=/usr/local/cuda-10.2/bin:/usr/local/cuda-10.2/NsightCompute-2019.1${PATH:+:${PATH}}
# export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64\
#                          ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
# sudo systemctl enable nvidia-persistenced

# echo "[Dependency installation]"
# sudo apt-get install -y g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev