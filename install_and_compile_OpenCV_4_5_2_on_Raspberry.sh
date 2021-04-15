#!/bin/dash

# Enlaces empleados:
# - https://learnopencv.com/install-opencv-4-on-raspberry-pi/

# Download OpenCV 4.5.2
wget https://github.com/opencv/opencv/archive/4.5.2.zip
# Create installation folder
mkdir OpenCV
# Unzip sources in compile folder
unzip 4.5.2.zip -d OpenCV
# Update and upgrade the current packages
sudo apt -y update
sudo apt -y upgrade
# Install OS Libraries
sudo apt-get -y remove x264 libx264-dev

## Install dependencies
sudo apt-get -y install build-essential checkinstall cmake pkg-config yasm
sudo apt-get -y install git gfortran
sudo apt-get -y install libjpeg8-dev libjasper-dev libpng12-dev

sudo apt-get -y install libtiff5-dev

sudo apt-get -y install libtiff-dev

sudo apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt-get -y install libxine2-dev libv4l-dev
cd /usr/include/linux
sudo ln -s -f ../libv4l1-videodev.h videodev.h
cd 

sudo apt-get -y install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt-get -y install libgtk2.0-dev libtbb-dev qt5-default
sudo apt-get -y install libatlas-base-dev
sudo apt-get -y install libmp3lame-dev libtheora-dev
sudo apt-get -y install libvorbis-dev libxvidcore-dev libx264-dev
sudo apt-get -y install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get -y install libavresample-dev
sudo apt-get -y install x264 v4l-utils
sudo apt-get -y install libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev


# Optional dependencies
sudo apt-get -y install libprotobuf-dev protobuf-compiler
sudo apt-get -y install libgoogle-glog-dev libgflags-dev
sudo apt-get -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

# Install Python Libraries
sudo apt-get -y install python3-dev python3-pip
sudo pip install --upgrade pip
sudo -H pip3 install -U pip numpy
sudo -H pip3 install -U pip dlib
sudo apt-get -y install python3-testresources

# Modify swap file
sudo sed -i 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=1024/g' /etc/dphys-swapfile
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start

# Compile and install OpenCV
cd OpenCV/opencv-4.5.2/
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
            -D CMAKE_INSTALL_PREFIX=/usr/local \
            -D BUILD_opencv_python3=yes \
            -D INSTALL_C_EXAMPLES=ON \
            -D INSTALL_PYTHON_EXAMPLES=ON \
            -D WITH_TBB=ON \
            -D WITH_V4L=ON \
            -D ENABLE_NEON=ON \
            -D ENABLE_VFPV3=ON \
            -D WITH_QT=ON \
            -D WITH_OPENGL=ON \
            -D BUILD_EXAMPLES=ON ..

make -j2
sudo make install && sudo ldconfig


# Restore swap file
sudo sed -i 's/CONF_SWAPSIZE=1024/CONF_SWAPSIZE=100/g' /etc/dphys-swapfile
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start

# Download aruco
cd 
mkdir Aruco
wget https://downloads.sourceforge.net/project/aruco/3.1.12/aruco-3.1.12.zip
# Unzip sources in installation folder
unzip aruco-3.1.12.zip -d Aruco/
cd Aruco
cd aruco-3.1.12
mkdir build
cd build
cmake ..
make -j2
sudo make install && sudo ldconfig
sudo -H pip3 install -U pip aruco

cd
git clone https://github.com/fehlfarbe/python-aruco.git
cd python-aruco/example

# python3 ./example.py



# Add to file: /etc/ssh/sshd_config

# sudo nano /etc/ssh/sshd_config

# AllowTcpForwarding yes
# X11Forwarding yes

# Y seguir este tutorial en caso de tener la instalación de Raspbery Os Lite
# https://peppe8o.com/run-raspberry-pi-os-lite-gui-applications-from-remote-windows-pc/

