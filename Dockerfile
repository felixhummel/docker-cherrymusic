FROM ubuntu:12.04

RUN echo 'deb http://de.archive.ubuntu.com/ubuntu/ precise main restricted universe' > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install --yes --no-install-recommends\
        git\
        python-pip\
        vorbis-tools\
        lame\
        flac\
        imagemagick

RUN git clone git://github.com/devsnd/cherrymusic.git

RUN pip install cherrypy

ADD cherrymusic.conf /.config/cherrymusic/cherrymusic.conf
WORKDIR cherrymusic

ENTRYPOINT python cherrymusic

