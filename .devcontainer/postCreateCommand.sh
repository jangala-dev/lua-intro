#!/bin/sh

sudo apt update -y

sudo apt install -y apt-utils unzip curl wget git build-essential libreadline-dev dialog libssl-dev

cd /tmp

# install lua

curl -R -O http://www.lua.org/ftp/lua-5.1.5.tar.gz
tar -zxf lua-*
rm lua-5.1.5.tar.gz
cd lua-*
make linux test
sudo make install
cd ..
rm -rf lua-*

# install LuaRocks

wget https://luarocks.org/releases/luarocks-3.7.0.tar.gz
tar zxpf luarocks-*
rm luarocks-3.7.0.tar.gz
cd luarocks-*
./configure --with-lua-include=/usr/local/include
make
sudo make install
cd ..
rm -rf luarocks-*

sudo mkdir -p /usr/local/lib/luarocks/rocks-5.1

# install luasocket

sudo luarocks install luasocket

# install nixio (the version on luarocks is broken - lovely)

git clone https://github.com/Neopallium/nixio
cd nixio/
sudo luarocks make

cd ..

# install lumen

git clone https://github.com/xopxe/lumen
sudo cp -r lumen /usr/local/lib/lua/*/

exit 0