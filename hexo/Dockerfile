FROM node:lts

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global \
	PATH=$PATH:/home/node/.npm-global/bin

RUN wget https://github.com/krallin/tini/releases/download/v0.19.0/tini-static-arm64 -O /opt/tini \
	&& chmod +x /opt/tini

RUN npm config set registry https://registry.npm.taobao.org \
	&& npm install -g hexo-cli

WORKDIR /mnt
ENTRYPOINT [ "/opt/tini", "--", "hexo" ]
