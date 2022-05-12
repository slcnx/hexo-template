#!/bin/bash
git config --local pull.rebase true
git add .
git commit -m "笔记本-`date +%F_%T`"


git push origin master

git pull origin master
[ $? -ne 0 ] && exit -1

git push origin master

# test
start $(readlink -f .)/source/_posts