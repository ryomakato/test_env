
FROM ubuntu:18.04

RUN apt-get update
RUN apt-get upgrade -y --no-install-recommends \
	sudo \
	vim \
	git \
	wget
RUN sudo apt-get autoremove && sudo apt-get clean	

# make user
ENV USER docker
RUN useradd -m ${USER}
RUN echo "${USER}:${USER}" | chpasswd
RUN adduser ${USER} sudo	
RUN echo "${USER} ALL=NOPASSWD:ALL" >> /etc/sudoers
