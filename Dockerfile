FROM ubuntu:16.04
MAINTAINER aheimberger


# setup default build arguments
ARG GROUP_ID=1000
ARG USER_ID=1000
ARG USER_NAME=travisci
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
RUN groupadd -g "${GROUP_ID}" "${USER_NAME}" && \
    useradd -u ${USER_ID} -g ${GROUP_ID} -ms /bin/bash ${USER_NAME}


# test it locally
COPY . ${DIR_PROJECT}
RUN cd ${DIR_PROJECT} && \
    git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -n1 && \
    chown -R ${USER_NAME} ${DIR_PROJECT} && \
    chgrp -R ${USER_NAME} ${DIR_PROJECT}


# switch user
USER ${USER_NAME}


# create deploy directory
RUN mkdir -p ${DIR_DEPLOY}


# setup the working directory
WORKDIR ${DIR_PROJECT}


# setup entrypoint function
ENTRYPOINT ["./Scripts/entrypoint.sh"]
CMD ["help"]
