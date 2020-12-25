FROM ubuntu:latest

RUN apt-get -y update --fix-missing && apt-get -y upgrade && \
    apt-get install -y alsa-utils  && \
    apt-get install -y pulseaudio && \
    apt-get install -y mpd && \
    apt-get autoremove -y && \
    apt-get clean

ADD mpd.conf /etc/mpd.conf
ADD run.sh /home/mpd/run.sh

RUN groupadd mpd && \
    mkdir -p /home/mpd/pids && \
    mkdir -p /home/mpd/logs

RUN chown -R mpd /home/mpd
RUN chmod +x /home/mpd/run.sh

EXPOSE 6600 6600

ENTRYPOINT /home/mpd/run.sh