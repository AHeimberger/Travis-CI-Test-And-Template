FROM ubuntu:16.04
MAINTAINER aheimberger


# setup default build arguments
ARG USER_ID=no-id
ARG USER_NAME=travisci
ARG GIT_BRANCH=master
ARG GIT_URL=https://github.com/AHeimberger/TravisCiTest.git
ARG GIT_HASH=no-hash


# prerequisites
RUN apt-get -qq update && \
	apt-get -qq dist-upgrade && \
	\
	apt-get install -qq -y --no-install-recommends \
	git openssl ca-certificates


# lets create a user
RUN useradd ${USER_NAME}
USER ${USER_NAME}


# setup environment directories
ENV DIR_HOME		/home/${USER_NAME}
ENV DIR_DEPLOY		${DIR_HOME}/deploy
ENV DIR_PROJECT		${DIR_HOME}/project


# setup directories
WORKDIR ${DIR_PROJECT}


# lets checkout the repository use https because of ssh key verification
RUN git clone -b ${GIT_BRANCH} ${GIT_URL} ${DIR_PROJECT} && \
	if [ ${GIT_HASH} != "no-hash" ]; then cd ${DIR_PROJECT} && git reset --hard ${GIT_HASH}; fi
