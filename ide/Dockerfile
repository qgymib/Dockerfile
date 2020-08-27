FROM ubuntu:latest

ARG DOCKER_USER=me
ENV NPM_CONFIG_PREFIX=/home/${DOCKER_USER}/.npm-global \
	PATH=$PATH:/home/${DOCKER_USER}/.npm-global/bin

# Add necessary dependency
RUN sed -i 's/ports.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
	&& sed -i 's/#\ deb-src/deb-src/g' /etc/apt/sources.list \
	&& apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
		sudo \
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
		vim \
		bash-completion \
		wget \
		curl \
		git \
		global \
		universal-ctags \
		ripgrep \
		ack \
		tmux \
	&& curl -sL https://deb.nodesource.com/setup_lts.x | bash - \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
		nodejs \
	&& rm -rf /var/lib/apt/lists/*

# Use tini to ensures that the default signal handlers work for the software you run in docker image
RUN wget https://github.com/krallin/tini/releases/download/v0.19.0/tini-static-arm64 -O /opt/tini \
	&& chmod +x /opt/tini

# Add user
RUN groupadd -r ${DOCKER_USER} -g 1000 \
	&& useradd -u 1000 -r -g ${DOCKER_USER} -m -d /home/${DOCKER_USER} -s /sbin/nologin -c "${DOCKER_USER}" ${DOCKER_USER} \
	&& chown -R ${DOCKER_USER} /home/${DOCKER_USER} \
	&& adduser ${DOCKER_USER} sudo \
	&& echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Add neovim plugin support
RUN pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
	&& pip3 install --system pynvim pygments

# Set the user to use when running this image
USER ${DOCKER_USER}

# Speedup npm install progress
RUN npm config set registry https://registry.npm.taobao.org

WORKDIR /mnt
ENTRYPOINT ["/opt/tini", "--"]
CMD ["vim"]

