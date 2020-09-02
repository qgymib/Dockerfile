FROM ubuntu:latest

# Add necessary dependency
RUN sed -i 's/ports.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
	&& sed -i 's/#\ deb-src/deb-src/g' /etc/apt/sources.list \
	&& apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
		build-essential \
		clang \
		libclang-dev \
		zlib1g-dev \
		libncurses-dev \
		cmake \
		git \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN git clone --depth=1 --recursive https://github.com/MaskRay/ccls ccls
RUN cd ccls \
	&& mkdir build \
	&& cd build \
	&& cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/ccls .. \
	&& make && make install


