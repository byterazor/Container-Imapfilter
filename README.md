# ImapFilter Container Image

This repository contains the Containerfile and associated scripts for a container image that runs [imapfilter](https://github.com/lefcha/imapfilter).

The container is based on alpine linux to keep it small.

## Author

- Dominik Meyer <dmeyer@federationhq.de>


## Prerequisites

- Buildah

## Usage

### Building the Container Image

You can build the container image using the following command:

\```bash
buildah bud -t imapfilter:latest .
\```

### Running the Container

You can create and run a container from this image with the following command:

\```bash
podman run -d --name imapfilter imapfilter:latest
\```

### Pushing the Container Image to a Registry

With Buildah:

\```bash
buildah push imapfilter:latest docker://<registry>/<username>/imapfilter:latest
\```

Replace `<registry>` with the name of your Docker registry and `<username>` with your username on that registry.

## Configuration

T.b.d.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
