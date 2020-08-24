#!/bin/bash

docker run -it --rm \
	--user $(id -u):$(id -g) \
	-v $PWD:/mnt \
	-v /home/qgymib/.ssh:/home/node/.ssh \
	hexo $@

