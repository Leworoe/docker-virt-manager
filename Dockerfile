FROM ghcr.io/leworoe/broadway-baseimage:main

ENV FAVICON_URL="/images/virt-manager.png"
ENV APP_TITLE="Virtual Machine Manager"
ENV CORNER_IMAGE_URL="/images/virt-manager.png"
ENV HOSTS="[]"

RUN apt update && apt upgrade -y
RUN apt install -y --no-install-recommends virt-manager dbus-x11 libglib2.0-bin gir1.2-spiceclientgtk-3.0 ssh at-spi2-core
RUN apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.ssh
RUN echo "Host *\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

COPY startapp.sh /usr/local/bin/startapp
COPY virt-manager.png /www/data/images/virt-manager.png

CMD ["/usr/local/bin/startapp"]
