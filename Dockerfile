FROM continuumio/miniconda3

LABEL author="Tom Tan <rockonedge@live.com>"
LABEL version="1.0"

USER root

# set to China mirrors: https://mirror.tuna.tsinghua.edu.cn/help/debian/
COPY sources.list /etc/apt/sources.list

RUN apt-get update -q  --fix-missing && apt-get install -qq -y --no-install-recommends \
    unzip \
    aria2 \
    ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN cd /tmp \
    && aria2c https://github.com/joewalnes/websocketd/releases/download/v0.3.0/websocketd-0.3.0-linux_amd64.zip -o websocketd.zip \
    && unzip -q websocketd.zip \
    && mv /tmp/websocketd /usr/local/bin/websocketd \
    && chmod +x /usr/local/bin/websocketd \
    && rm *.*   \
    && websocketd --version 

RUN aria2c https://yt-dl.org/downloads/latest/youtube-dl -d /usr/local/bin -o youtube-dl \
    && chmod a+rx /usr/local/bin/youtube-dl \
    && youtube-dl --version 

EXPOSE 30000
    
COPY scripts/ /scripts/
CMD [ "sh", "-c", "/scripts/init.sh; bash"]

WORKDIR /scripts

