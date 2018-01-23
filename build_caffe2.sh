#!/bin/bash

# https://caffe2.ai/docs/getting-started.html?platform=mac&configuration=compile#custom-anaconda-install
# Create a conda environment (optional)
# conda create -n caffe2 && source activate caffe2

# (Optional) these packages are needed for some of the ipython jupyter notebook
# tutorials, but not for base Caffe2
conda install -y --channel https://conda.anaconda.org/conda-forge \
    glog \
    numpy \
    protobuf \
    snappy \
    six \
    graphviz \
    hypothesis \
    leveldb \
    mkl \
    mkl-include \
    lmdb \
    opencv \
    ffmpeg \
    tbb \
    matplotlib \
    pydot \
    pyyaml \
    requests \
    scikit-image \
    scipy \
    unzip \
    future


# Clone Caffe2
git submodule update --init --recursive

# Make Caffe2 in a separate folder to avoid polluting the Caffe2 source tree.
# This can be anywhere you want it
mkdir -p build-tree && cd $_

# Add flags to this command to control which packages you want to use. The
# options to use are at the top of CMakeLists.txt in the topmost Caffe2
# directory
cmake \
    -DUSE_CUDA=OFF \
    -DUSE_LEVELDB=OFF \
    -DCMAKE_PREFIX_PATH="${HOME}/miniconda/envs/caffe2" \
    -DCMAKE_INSTALL_PREFIX="${HOME}/miniconda/envs/caffe2" \
    ..

#make -j8 install
