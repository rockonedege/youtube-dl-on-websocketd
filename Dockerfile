FROM continuumio/miniconda3

LABEL author="Tom Tan <rockonedge@live.com>"
LABEL version="1.1"

USER root

# set to China mirrors: https://mirror.tuna.tsinghua.edu.cn/help/debian/
COPY sources.list /etc/apt/sources.list

RUN apt-get update -q  --fix-missing && apt-get install -qq -y --no-install-recommends \
    unzip \
    aria2 \
    ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo "getting websocketd ..." \
    && cd /tmp \
    && aria2c https://github.com/joewalnes/websocketd/releases/download/v0.3.0/websocketd-0.3.0-linux_amd64.zip -o websocketd.zip \
    && unzip -q websocketd.zip \
    && mv /tmp/websocketd /usr/local/bin/websocketd \
    && chmod +x /usr/local/bin/websocketd \
    && rm *.*   \
    && websocketd --version \
    && echo "getting youtube-dl ..." \
    && aria2c https://yt-dl.org/downloads/latest/youtube-dl -d /usr/local/bin -o youtube-dl \
    && chmod a+rx /usr/local/bin/youtube-dl \
    && youtube-dl --version \
    && echo "clone python src code" \
    && mkdir /scripts && cd /scripts && aria2c https://github.com/rockonedege/async-youtube-dl/archive/master.zip -o async-youtube-dl.zip \
    && unzip -q async-youtube-dl.zip \
    && rm async-youtube-dl.zip 

EXPOSE 30000
    
COPY scripts/ /scripts
CMD [ "bash", "-c", "chmod +x /scripts/init.sh && /scripts/init.sh; bash"]

WORKDIR /scripts

