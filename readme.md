**A Dockerfile starting a selenium standalone server with Chrome and Firefox beta.**

It exposes: - selenium standalone server running on localhost:4444 - vnc server running on localhost:5999, password: secret

Running the browsers:

    docker pull vvoyer/docker-selenium-firefox-chrome
    docker run --privileged -p 4444:4444 -p 5999:5999 -d vvoyer/docker-selenium-firefox-chrome


Running the tests:

    bundle install
    ruby test_example


Additional steps for OSX (using boot2docker)

Due to the idiosyncrasies of OSX, and the fact that Docker is only compatible with linux,
you will need to use either a virtual machine running linux or the boot2docker package.
The instructions below assume use of boot2docker.

First install boot2docker by following instructions here: https://docs.docker.com/installation/mac/

Then run the following:

    boot2docker init
    boot2docker start
    eval "$(boot2docker shellinit)"

You can verify your setup by running:

    docker run hello-world

Gotchas:
boot2docker will expose an ip address as the DOCKER_HOST address, so replace localhost with the output of:

    boot2docker ip

Boot2docker might complain about a verison mismatch between the client and the server, in which case upgrade it by running:

    boot2docker stop && boot2docker download && boot2docker up
