
FROM ubuntu:18.04

#ENV DEBCONF_NOWARNINGS yes
RUN apt-get update
RUN apt-get upgrade -y --no-install-recommends \
	sudo \
	vim \
	git \
	wget
RUN sudo apt-get autoremove && sudo apt-get clean	

# install what you want
#RUN apt-get update
#RUN apt-get upgrade -y --no-install-recommends \

ENV USER docker
RUN useradd -m ${USER}
RUN echo "${USER}:${USER}" | chpasswd
RUN adduser ${USER} sudo	
USER ${USER}

# make user
#ENV USER docker
#ARG UID=9001
#ARG GID=9001
#RUN sudo useradd -u $UID -o -m ${USER}
#RUN sudo groupmod -g $GID -o ${USER}
#USER ${USER}
