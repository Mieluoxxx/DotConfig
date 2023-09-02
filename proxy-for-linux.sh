#!/bin/bash

apps_folder=~/Apps

if [ ! -d "$apps_folder" ]; then
  mkdir -p "$apps_folder"
fi

cd $apps_folder
if [ ! -d "clash-for-linux" ]; then
  git clone https://gitee.com/real-night/clash-for-linux.git
  if [ $? -ne 0 ]; then
    echo "克隆失败"
    exit 1
  fi

  cd "clash-for-linux"
  sudo bash start.sh
  sudo chmod 777 /etc/profile.d/clash.sh
  echo 'source /etc/profile.d/clash.sh' >> ~/.zshrc
  echo 'proxy_on' >> ~/.zshrc
fi
