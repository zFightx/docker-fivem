FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    lib32gcc1 \
    ca-certificates \
    curl \
    xz-utils \
    && rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=nointeractive

RUN mkdir -p /fivem/server \
    && curl -o /fivem/server/fx.tar.xz https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/7290-a654bcc2adfa27c4e020fc915a1a6343c3b4f921/fx.tar.xz \
    && tar -xf /fivem/server/fx.tar.xz -C /fivem/server \
    && rm /fivem/server/fx.tar.xz

WORKDIR /fivem/server

EXPOSE 30120

CMD ["bash", "/fivem/server/run.sh"]
