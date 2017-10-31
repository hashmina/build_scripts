#!/bin/sh

MONGO_VERSION="3.2.6"

sudo apt update
sudo apt install -y \
    unzip htop ncdu vnstat aria2 p7zip-full git-core \
    screen silversearcher-ag

cd /tmp

wget http://johnvansickle.com/ffmpeg/builds/ffmpeg-git-64bit-static.tar.xz
tar xf ffmpeg*.tar.xz
sudo mv /tmp/ffmpeg-git-20*/ffmpeg /usr/local/bin

wget http://ftp6.nero.com/tools/NeroAACCodec-1.5.1.zip
unzip NeroAACCodec-1.5.1.zip -d /tmp linux/*
sudo mv /tmp/linux/* /usr/local/bin
sudo chmod 777 /usr/local/bin/*

sudo pip install -U bpython django redis httpie youtube_dl pafy

wget https://nodejs.org/dist/v6.2.0/node-v${NODE_VERSION}-linux-x64.tar.xz
sudo tar xf node-v${NODE_VERSION}-linux-x64.tar.xz --dir=/opt
sudo mv /opt/node-v${NODE_VERSION}-linux-x64 /opt/node

wget http://geoff.greer.fm/ag/releases/the_silver_searcher-0.32.0.tar.gz
tar xf the_silver_searcher-0.32.0.tar.gz
cd the_silver_searcher-0.32.0
./configure
make
cd ..


wget http://download.redis.io/redis-stable.tar.gz
tar xf redis-stable.tar.gz
cd redis-stable
make
sudo make install
cd ..

# wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu1404-${MONGO_VERSION}.tgz
# tar xf mongodb-linux-x86_64-ubuntu1404-${MONGO_VERSION}

cd /tmp
cd the_silver_searcher-0.32.0
sudo make install
cd ..
cd redis-stable
sudo make install
cd ..


# sudo mv /tmp/mongodb-linux-x86_64-ubuntu1404-${MONGO_VERSION}/bin/* /usr/local/bin/*
sudo ln -s /{opt/node/bin,usr/local/bin}/node
sudo ln -s /{opt/node/bin,usr/local/bin}/npm
