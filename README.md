# Caddy (with njalla support)

<p align="center">
  <img src="https://i.imgur.com/BPSYXLw.png" alt="caddy" style="width: 25%;"/>
</p>

<p align="center">
  <a href="https://github.com/engels74/caddy"><img src="https://img.shields.io/docker/v/engels74/caddy?sort=semver" alt="GitHub tag (SemVer)"></a>
  <a href="https://github.com/engels74/caddy/blob/master/LICENSE"><img src="https://img.shields.io/badge/License%20(Image)-GPL--3.0-orange" alt="License (Image)"></a>
  <a href="https://hub.docker.com/r/engels74/caddy"><img src="https://img.shields.io/docker/pulls/engels74/caddy.svg" alt="Docker Pulls"></a>
  <a href="https://github.com/engels74/caddy/stargazers"><img src="https://img.shields.io/github/stars/engels74/caddy.svg" alt="GitHub Stars"></a>
</p>

## 📖 Documentation

All the documentation for the "caddy" is located here.

For more information about the Docker image itself, you can visit [engels74.net](https://engels74.net/containers/caddy).

> **Regarding libdns/njalla plugin**:
>
> While we are waiting for the [pull request](https://github.com/libdns/njalla/pull/2) to get merged, I've replaced the libdns plugin with the one [being merged](https://github.com/engels74/libdns-njalla) from the pull request.

## 🐋 Docker Image

### Docker Compose

To get started with caddy using Docker, follow these steps:

1. **Use this Docker Compose example**
    ```yaml
	services:
	  caddy:
	    container_name: caddy
	    image: ghcr.io/engels74/caddy
	    ports:
	      - "80:8080"
	      - "443:8443"
	    environment:
	      - PUID=1000
	      - PGID=1000
	      - UMASK=002
	      - TZ=Etc/UTC
	      - CUSTOM_BUILD
	    volumes:
	      - /<host_folder_config>:/config
    ```

2. **Run the Docker container using `docker compose`:**
    ```sh
    docker compose -f /choose/path/to/docker-compose.caddy.yml up -d
    ```

## 🆘 Support

If you need assistance, you can try asking in the [hotio Discord](https://hotio.dev/discord), but you probably won't receive support for this image specifically.

## 💻 Source Code

- **Project Source Code** (Caddy): The source code for the "Caddy" project is hosted at [[caddyserver/caddy](https://github.com/caddyserver/caddy)].

- **Docker Image Source**: The source files for building the Docker image are hosted at [[engels74/caddy](https://github.com/engels74/caddy)]. If you can't find what you're looking for in the `master` branch, check other branches.

## 🌟 Show your support

You can show your support by:
- Giving us a star on Docker Hub or GitHub
- Making a [donation](https://hotio.dev/donate) to hotio, as he's the genius behind the Docker images

Your support is greatly appreciated!
