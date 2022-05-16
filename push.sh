#!/bin/bash
git config --local pull.rebase true

# 获取邮箱
email=$(git config --global user.email)
if [ -z "$email" ]; then
  while true; do
    read -p 'enter your email: ' email
    if [ -z "$email" ]; then
      continue
    else
      git config --global user.email "$email"
      break
    fi
  done
fi

# 获取用户名
name=$(git config --global user.name)
if [ -z "$name" ]; then
  while true; do
    read -p 'enter your name: ' name
    if [ -z "$name" ]; then
      continue
    else
      git config --global user.name "$name"
      break
    fi
  done
fi




git add .
git commit -m "笔记本-`date +%F_%T`"


git push origin main

git pull origin main
[ $? -ne 0 ] && exit -1

git push origin main

# test
start $(readlink -f .)/source/_posts
