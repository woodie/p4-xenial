FROM ubuntu:xenial

COPY .p4config .
ENV P4CONFIG .p4config

ADD http://package.perforce.com/perforce.pubkey /tmp/
RUN apt-key add /tmp/perforce.pubkey \
  && echo 'deb http://package.perforce.com/apt/ubuntu/ xenial release' > /etc/apt/sources.list.d/perforce.list \
  && apt-get update \
  && apt-get install -y helix-cli vim

CMD ["/bin/bash"]
