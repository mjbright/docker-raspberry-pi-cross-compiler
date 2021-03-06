FROM ubuntu:trusty
MAINTAINER Stephen Thirlwall <sdt@dr.com>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        automake \
        bc \
        bison \
        cmake \
        curl \
        flex \
        lib32stdc++6 \
        lib32z1 \
        ncurses-dev \
        ;

WORKDIR /rpxc
RUN curl -s -L https://github.com/raspberrypi/tools/tarball/master | \
        tar --strip-components 1 -xzf -

WORKDIR /build
ENTRYPOINT [ "/rpxc/entrypoint.sh" ]

COPY imagefiles/entrypoint.sh imagefiles/rpxc /rpxc/
