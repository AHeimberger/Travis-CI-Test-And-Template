DIR_TRAVISCI="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

travisCiDirectory()
{
    echo "${DIR_TRAVISCI}"
}

travisCiBuild()
{
    cd "${DIR_TRAVISCI}"
    docker build -t travis-template .
}

travisCiRun()
{
    cd "${DIR_TRAVISCI}"
    docker run --rm=true -it travis-template /bin/bash
}

