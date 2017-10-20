![MIT License](https://img.shields.io/github/license/mashape/apistatus.svg)
[![Build Status](https://travis-ci.org/AHeimberger/TravisCI.svg?branch=master)](https://travis-ci.org/AHeimberger/TravisCI)

# Travis CI - Test and Template


## How To
1. Install [Docker](https://www.docker.com/)
2. Clone this repository, change into directory
3. Build Image **docker build -t travis-template .**
4. Run Image **docker run --rm=true -it travis-template**
5. Run Image without menu **docker run --rm=true -it travis-template /bin/bash**


## Travis Setup
- Create Github account
- Create Git-Repository
- Login to Travis with Github Account
- Add Git-Repository to Travis-Ci
- Add .travis.yml file
- Add badge url to show build status
