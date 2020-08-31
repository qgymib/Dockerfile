FROM ubuntu:latest

ENV DOCKER_USER=ide
ENV NPM_CONFIG_PREFIX=/home/${DOCKER_USER}/.npm-global \
	PATH=$PATH:/home/${DOCKER_USER}/.npm-global/bin:/home/${DOCKER_USER}/bin

# Add necessary dependency
RUN sed -i 's/ports.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
	&& sed -i 's/#\ deb-src/deb-src/g' /etc/apt/sources.list \
	&& apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
		gosu \
		tini \
		build-essential \
		clang \
		lldb \
		gdb \
		valgrind \
		clangd \
		cmake \
		autoconf \
		automake \
		lcov \
		doxygen \
		graphviz \
		python3 \
		python3-pip \
		python3-setuptools \
		vim-nox \
		bash-completion \
		wget \
		curl \
		git \
		global \
		universal-ctags \
		ripgrep \
		ack \
	&& curl -sL https://deb.nodesource.com/setup_lts.x | bash - \
	&& sed -i 's/deb.nodesource.com\/node/mirrors.tuna.tsinghua.edu.cn\/nodesource\/deb/g' \
		/etc/apt/sources.list.d/nodesource.list \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
		nodejs \
	&& rm -rf /var/lib/apt/lists/*

# Add user
RUN groupadd -r ${DOCKER_USER} -g 1000 \
	&& useradd -u 1000 -r -g ${DOCKER_USER} -m -d /home/${DOCKER_USER} \
		-s /sbin/nologin -c "${DOCKER_USER}" ${DOCKER_USER} \
	&& chown -R ${DOCKER_USER} /home/${DOCKER_USER} \
	&& adduser ${DOCKER_USER} sudo \
	&& echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Add neovim plugin support
RUN npm config set registry https://registry.npm.taobao.org \
	&& pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
	&& pip3 install --system pynvim pygments

# Write entrypoint.sh
COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /mnt
ENTRYPOINT [ "tini", "--", "entrypoint.sh" ]
CMD [ "vim" ]

