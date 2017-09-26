# java-9-docker-image
A dockerfile to build a java9 image from ubuntu LTS (ubuntu:xenial).

Installs java 9 through webupd8: https://launchpad.net/~webupd8team/+archive/ubuntu/java . 
Java9 is set as default java though use of alternatives: http://manpages.ubuntu.com/manpages/saucy/man8/update-alternatives.8.html Adds JCE.

## Installation
You must have **docker** installed in your machine (see https://docs.docker.com/engine/installation/) .
Download the dockerfile and run in its directory:

```
docker build -t java9:latest .

```

You can view the new image created with name **java9** and tag **latest** with:

```
docker images

```

Now you can run the container:

```
docker run -i -t java9:latest /bin/bash

```

