FROM node:lts

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
	&& sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
		aria2 \
		bash-completion \
	&& rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/krallin/tini/releases/download/v0.19.0/tini-static-arm64 -O /opt/tini \
	&& chmod +x /opt/tini

# set the user to use when running this image
USER node

RUN npm config set registry https://registry.npm.taobao.org \
	&& npm install -g hexo-cli

WORKDIR /mnt
ENTRYPOINT ["/opt/tini", "--", "hexo"]

