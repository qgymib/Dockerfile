#!/bin/bash

if [ ! -f "/opt/vimfiles/.vim/autoload/plug.vim" ]; then
	curl -fLo /opt/vimfiles/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

docker run -it --rm \
	-v $(pwd):/mnt \
	-v /opt/vimfiles:/home/ide \
	-e COLUMNS="`tput cols`" -e LINES="`tput lines`" \
	ide

