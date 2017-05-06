![MIT License](https://img.shields.io/github/license/mashape/apistatus.svg)
![Build Badge Travis](https://travis-ci.org/AHeimberger/Travis-CI-Test-And-Template.svg?branch=master)

# Travis CI - Test and Template

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
