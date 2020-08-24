FROM ubuntu:latest

RUN sed -i 's/ports.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
	&& sed -i 's/#\ deb-src/deb-src/g' /etc/apt/sources.list \
	&& apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
		build-essential \
		clang \
		lldb \
		gdb \
		valgrind \
		cmake \
		autoconf \
		automake \
		lcov \
		doxygen \
		graphviz \
	&& rm -rf /var/lib/apt/lists/*

