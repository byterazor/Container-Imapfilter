---
lang: EN_US
---

# ImapFilter Container Image

## Description

This repository contains the Containerfile and associated scripts for a container image that runs [imapfilter](https://github.com/lefcha/imapfilter).

The image is based on Alpine Linux and compiles the main branch of 
imapfilter in a build image so that the bare imapfilter image is 
as small as possible.

imapfilter is running in a loop waiting 500 seconds between each 
run. 

## Security

Imapfilter is running with a non-root userid to improve security.
In kubernetes you can also enforce running the image with readonly 
root directory.

## Supported Architectures

- amd64
- arm64

## Updates

I am trying to update the image weekly as long as my private kubernetes cluster is available. So I do not promise anything and do **not** rely 
your business on this image.

## Prerequisities

A container runtime like

* docker 
* podman
* kubernetes


## Container Parameters

At the moment there are no parameters but there will be 
some added in the future.


## Volumes

You have to mount the imapfilter config file to /home/imapfilter/config.lua. This can be done by a bind mount or a configmap in kubernetes.

## Source Repository

* https://gitea.federationhq.de/Container/imapfilter.git

## Authors

* **Dominik Meyer** - *Initial work* 

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
