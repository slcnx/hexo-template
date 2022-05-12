#!/bin/bash
git config --local pull.rebase true
git add .
git commit -m "笔记本-`date +%F_%T`"


git push origin main

git pull origin main
[ $? -ne 0 ] && exit -1

git push origin main

# test
start $(readlink -f .)/source/_posts