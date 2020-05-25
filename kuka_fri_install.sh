#!/bin/bash

echo "[Update the package lists and upgrade them]"
sudo apt update
sudo apt upgrade -y

echo "[Create installation folder]"
mkdir -p ~/ros_ws/kuka_raw_driver_install
cd ~/ros_ws/kuka_raw_driver_install

echo "[----------> FRI <------------------]"
git clone https://github.com/prachandabhanu/KUKA_FRI.git
cd KUKA_FRI
rm -rf FRI-Client-SDK_Cpp.zip
rm -rf kuka_fri-master.zip
cd kuka_fri
./waf configure
./waf
sudo ./waf install

echo "[----------> SpaceVecAlg <------------------]"
cd ~/ros_ws/kuka_raw_driver_install
git clone --recursive https://github.com/costashatz/SpaceVecAlg.git
cd SpaceVecAlg
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_SIMD=ON -DPYTHON_BINDING=OFF ..
make -j$(nproc)
sudo make install

echo "[----------> RBDyn <------------------]"
cd ~/ros_ws/kuka_raw_driver_install
git clone --recursive https://github.com/costashatz/RBDyn.git
cd RBDyn
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_SIMD=ON -DPYTHON_BINDING=OFF ..
make -j$(nproc)
sudo make install

echo "[----------> mc_rbdyn_urdf <------------------]"
cd ~/ros_ws/kuka_raw_driver_install
git clone --recursive https://github.com/costashatz/mc_rbdyn_urdf.git
cd mc_rbdyn_urdf
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_SIMD=ON -DPYTHON_BINDING=OFF ..
make -j$(nproc)
sudo make install

echo "[----------> corrade <------------------]"
cd ~/ros_ws/kuka_raw_driver_install
git clone https://github.com/mosra/corrade.git
cd corrade
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install

echo "[----------> robot_controllers <------------------]"
cd ~/ros_ws/kuka_raw_driver_install
git clone https://github.com/epfl-lasa/robot_controllers.git
cd robot_controllers
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install