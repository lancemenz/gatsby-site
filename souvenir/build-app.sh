#!/bin/bash

remote_dir='/home/ec2-user/docker/docker-lnmp/app/src'

yarn build

cd ./public
rm -rf pub.zip
zip -q -r ./pub.zip ./*
scp -f ./pub.zip zen:$remote_dir
ssh zen 'cd '$remote_dir'; unzip -o pub.zip'
cd ..

