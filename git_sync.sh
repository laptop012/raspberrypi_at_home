#!/bin/bash -x

DATE=`date +%Y-%m-%d:%H:%M:%S`
git status
git add .
git commit -m "$DATE_commit"
git status
git push -u origin master
