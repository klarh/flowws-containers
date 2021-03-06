FROM mspells/plato-live:latest

USER root
WORKDIR /

ENV hoomd_ver=hoomd-v2.9.6
RUN wget https://glotzerlab.engin.umich.edu/Downloads/hoomd/${hoomd_ver}.tar.gz && \
    tar xf ${hoomd_ver}.tar.gz && \
    mkdir ${hoomd_ver}/build && \
    cd ${hoomd_ver}/build && \
    cmake .. -DBUILD_TESTING=off -DCMAKE_INSTALL_PREFIX=$(/usr/bin/python3 -c 'import sys;print([s for s in sys.path if "packages" in s][0])') && \
    make -j$(nproc) install && \
    cd ../.. && \
    rm -rf ${hoomd_ver} ${hoomd_ver}.tar.gz

USER user
WORKDIR /home/user/work

RUN python -m pip install --no-cache-dir \
        flowws-analysis \
        flowws-freud \
        flowws-unit-cell \
        freud-analysis==2.5.1 \
        garnett \
        gtar \
        hoomd-flowws \
        pyriodic-aflow

RUN git clone https://github.com/klarh/flowws-examples

LABEL maintainer="matthew.p.spellings@gmail.com" \
    org.opencontainers.image.authors="Matthew Spellings <matthew.p.spellings@gmail.com>" \
    org.opencontainers.image.description="Prerequisites to run live analysis and visualization using flowws." \
    org.opencontainers.image.documentation="https://github.com/klarh/flowws-containers" \
    org.opencontainers.image.source="https://github.com/klarh/flowws-containers" \
    org.opencontainers.image.title="Flowws-live" \
    org.opencontainers.image.url="https://github.com/klarh/flowws-containers"
