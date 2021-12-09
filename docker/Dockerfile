FROM ithacafv/openfoam2106:manifest-latest
LABEL maintainer="moaadkhamlich@gmail.com"

RUN apt-get update \
	&& apt-get install -y \
		vim \
		ssh \
		sudo\
		wget\
        git \
		software-properties-common ;\
		rm -rf /var/lib/apt/lists/*

# add and enable the default user
ARG USER=ithacafv
RUN adduser --disabled-password --gecos '' $USER
RUN adduser $USER sudo; echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN cp -r -R /root/* /opt/
WORKDIR /opt/

RUN git clone https://github.com/moaadkhamlich/ITHACA-FV.git

RUN /bin/bash -c "source OpenFOAM-v2106/etc/bashrc && \
    cd ITHACA-FV && git checkout docker &&  source etc/bashrc && \
    ./Allwmake -au -j 4";

#make sure everything is in place
RUN chown -R $USER:$USER /home/$USER
USER $USER
ENV HOME /home/$USER
ENV USER $USER


WORKDIR $HOME
COPY .vimrc $HOME/.
COPY bashrc $HOME/.bashrc
