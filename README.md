![MIT License](https://img.shields.io/github/license/mashape/apistatus.svg)
[![Build Status](https://travis-ci.org/AHeimberger/Travis-CI-Test-And-Template.svg?branch=master)](https://travis-ci.org/AHeimberger/Travis-CI-Test-And-Template)

# Travis CI - Test and Template


## How To
1. Install [Docker](https://www.docker.com/)
2. Clone this repository, change into directory
3. Build Image **docker build -t travis-template .**
4. Run Image **docker run --rm=true -it travis-template**
5. Run Image without menu **docker run --rm=true -it /bin/bash**
6. Build with local modifications: Uncomment **test it locally**, Comment **test it from remote**.


## Overview of the steps I did
- Create Github account
- Create Git-Repository
- Login to Travis with Github Account
- Add Git-Repository to Travis-Ci
- Start a build: First build will fail, no .travis.yml file
- Get the badge url to show the build status :)
- Added some content in the README to see if auto-build on push will be done.
- Yeah automatic builds are working
- Add a .travis.yml file with a simple echo, lets see what happens
- Wow so nice its working. Lets get nasty add a Dockerfile which will checkout this Repository
- Wuhuu I can checkout my github repository in my docker container. Had just problems with my directory and user rights. (since 584ce5bad)
- Add entrypoint shell script and add entrypoint to dockerfile, default cmd is help
- Add a build schedule within travis ci
- Added copy functionality, this way its possible to check something without pushing it :)
- Add environment variables to build correct branch and commit hash
