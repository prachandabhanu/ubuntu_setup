#!/bin/bash

echo "[Update the package lists and upgrade them]"
sudo apt update
sudo apt upgrade -y

echo "[Create installation folder]"
mkdir -p ~/ros_ws/pcl_raw_install
cd ~/ros_ws/pcl_raw_install

sudo apt install -y git cmake cmake-curses-gui

git clone --branch pcl-1.11.0 https://github.com/PointCloudLibrary/pcl.git
git clone --branch 3.3.7 https://gitlab.com/libeigen/eigen.git
git clone --branch 1.9.1 https://github.com/mariusmuja/flann.git
git clone --branch 2019.1 https://github.com/qhull/qhull.git
git clone --branch release-1.8.1 https://github.com/google/googletest.git

# wget -o eign-3.3.7.zip http://bitbucket.org/eigen/eigen/get/3.3.7.zip
# wget -o flann-1.9.1.zip https://github.com/mariusmuja/flann/archive/1.9.1.zip
# wget -o qhull-2019.1.tar.gz https://github.com/qhull/qhull/archive/2019.1.tar.gz
# wget  https://github.com/PointCloudLibrary/pcl/archive/pcl-1.11.0.tar.gz
# wget -o googletest-1.8.1.tar.gz https://github.com/google/googletest/archive/release-1.8.1.tar.gz

echo "[---------------------> Eigen <----------------------------]"
cd ~/ros_ws/pcl_raw_install/eigen 
if [ -d "build" ]; then
  sudo rm -r build
fi
mkdir build && cd build
cmake  -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
make -j8
sudo make install

echo "[---------------------> flann <----------------------------]"
cd ~/ros_ws/pcl_raw_install/flann
if [ -d "build" ]; then
  sudo rm -r build
fi
mkdir build && cd build
cmake  -DBUILD_MATLAB_BINDING=OFF -DBUILD_PYTHON_BINDING=OFF ..
make -j8
sudo make install

echo "[---------------------> qhull <----------------------------]"
cd ~/ros_ws/pcl_raw_install/qhull/build
cmake  -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
make -j8
sudo make install

echo "[---------------------> googletest <----------------------------]"
cd ~/ros_ws/pcl_raw_install/googletest
if [ -d "build" ]; then
  sudo rm -r build
fi
mkdir build && cd build
cmake  -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
make -j8
sudo make install

echo "[---------------------> pcl-1.11.1 <----------------------------]"
cd ~/ros_ws/pcl_raw_install/pcl
if [ -d "build" ]; then
  sudo rm -r build
fi
mkdir build && cd build
cmake  -DBUILD_CUDA=ON -DBUILD_GPU=ON -DBUILD_cuda_io=ON -DBUILD_gpu_surface=ON -DBUILD_gpu_tracking=ON ..
cmake  -DBUILD_CUDA=ON -DBUILD_GPU=ON -DBUILD_cuda_io=ON -DBUILD_gpu_surface=ON -DBUILD_gpu_tracking=ON ..
make -j8
sudo make install