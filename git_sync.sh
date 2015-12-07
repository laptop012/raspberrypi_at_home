#!/bin/bash -x

DATE=`date +%Y_%m_%d%H%M%S`
git status
git add .
git commit -m "four_commit"
git status
git push -u origin master
