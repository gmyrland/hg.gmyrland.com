FROM ubuntu
RUN apt-get update -y && \
    apt-get install hugo -y
WORKDIR /home/site
