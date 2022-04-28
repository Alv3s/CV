@echo off
set bat_dir=%~dp0
set bat_dir=%bat_dir:~0,-1%

@echo on
docker build -t alvescv - < Dockerfile
docker run --mount type=bind,src="%bat_dir%",dst="/home/node/CV" --mount type=volume,dst="/home/node/CV/node_modules" alvescv