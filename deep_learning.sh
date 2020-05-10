#!/bin/bash

# linux packages
apt-get update -y && \
apt-get install -y apt-utils \
					build-essential \
					cmake \
					curl  \
					cython3  \
					g++  \
					git  \
					libboost-all-dev \
					libjpeg-dev \
					libopenblas-base  \
					libsdl2-dev \
					rxvt-unicode-256color \
					swig \
					tmux \
					vim \
					x11-utils \
					xorg-dev \
					xvfb \
					zlib1g-dev

# install miniconda
if ! [ -x "$(command -v conda)" ]; then
    wget -O ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash ~/miniconda.sh 
    rm ~/miniconda.sh
fi

# setup deep learning base env
conda create --name dl
conda install pip
echo "alias dl='conda activate dl'" >> ~/.bashrc
pip install PyOpenGL==3.1.* PyOpenGL-accelerate==3.1.*
pip install numpy gym torch torchvision tensorboard
