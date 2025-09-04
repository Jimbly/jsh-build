jsh-build
=========

Dockerfiles and scripts for building jSH and DOjS for DOS and Win32 on any Docker-capable host.

Note: currently contains only scripts for building on a Windows host, but they're basically just a single `docker run` command so should be simple to adjust to run anywhere.

Requires Docker (use Docker Desktop on Windows), and will download the appropriate Docker images from DockerHub.  You can also build the Docker images yourself.

I have tested these Docker images successfully building the upstream jSH for DOS, DOjS for DOS and Win32, and the Jimbly/jSH for for DOS and Win32.

Usage
=====

One-time setup: clone this repo and your favorite fork of jSH (note `Jimbly` fork is currently required if you want to build jSH for Win32):
```sh
git clone git@github.com:Jimbly/jsh-build.git
cd jsh-build
git clone git@github.com:Jimbly/jSH.git
```

Optionally, modify `build.sh` appropriately for what you want to build (currently the default is to build jSH with `NOTCP` which makes a smaller build), or pass additional parameters for `make` to the `build-*` described below.

Then, to build for DOS:
```sh
build-dos
```

This should create `jSH/JSH.EXE`

Before switching targets, do a `distclean` to remove all intermediate files from the DOS build:
```sh
build-dos distclean
```

Then, build for Win32:
```sh
build-win32
```

This should create `jSH/JSH-W32.EXE`

Re-building the Docker images
=============================

You can modify `build-dos.bat` to re-build the Docker image each time (very quick if nothing changes), or simply manually rebuild the appropriate image with:
```sh
docker build -t jimbly/jsh-build-dos -f Dockerfile.dos .
docker build -t jimbly/jsh-build-win32 -f Dockerfile.win32 .
```
