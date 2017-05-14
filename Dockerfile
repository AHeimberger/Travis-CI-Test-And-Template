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


# setup environment directories
ENV DIR_HOME		/home/${USER_NAME}
ENV DIR_DEPLOY		${DIR_HOME}/deploy/
ENV DIR_PROJECT		${DIR_HOME}/project/


# lets create the user
RUN useradd -ms /bin/bash ${USER_NAME}
USER ${USER_NAME}


# setup directories
RUN mkdir -p ${DIR_DEPLOY} && \
	mkdir -p ${DIR_PROJECT}


# test it from remote
RUN git clone -b ${GIT_BRANCH} ${GIT_URL} ${DIR_PROJECT} && \
	if [ ${GIT_HASH} != "no-hash" ]; then cd ${DIR_PROJECT} && git reset --hard ${GIT_HASH}; fi


# test it locally
# COPY . ${DIR_PROJECT}


# setup the working directory
WORKDIR ${DIR_PROJECT}


# setup entrypoint function
ENTRYPOINT ["./Scripts/entrypoint.sh"]
CMD ["help"]
