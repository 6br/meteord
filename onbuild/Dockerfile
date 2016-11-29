FROM meteorhacks/meteord:base
MAINTAINER MeteorHacks Pvt Ltd.

ONBUILD RUN useradd -mU -u 11110 -d /home/docker -s /bin/bash docker \
 && echo "docker:docker" | chpasswd

#RUN echo "docker ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#COPY . /home/docker

ONBUILD RUN mkdir /copied-app \
         && mkdir /built_app

ONBUILD COPY ./ /app

ONBUILD RUN chown docker:docker -R $METEORD_DIR \
 && chown docker:docker -R /copied-app \
 && chown docker:docker -R /app \
 && chown docker:docker -R /built_app \
 && chown docker:docker -R /tmp


ONBUILD USER docker

ONBUILD ENV PATH /home/docker/.meteor:$PATH
ONBUILD ENV PORT 8888

ONBUILD RUN bash $METEORD_DIR/on_build.sh
