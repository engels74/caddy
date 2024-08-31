ARG UPSTREAM_IMAGE
ARG UPSTREAM_DIGEST_ARM64

FROM golang:alpine as builder
ARG VERSION
RUN apk add --no-cache curl jq
RUN xcaddy_version=$(curl -u "${GITHUB_ACTOR}:${GITHUB_TOKEN}" -fsSL "https://api.github.com/repos/caddyserver/xcaddy/releases/latest" | jq -r .tag_name | sed s/v//g) && \
    wget -O - "https://github.com/caddyserver/xcaddy/releases/download/v${xcaddy_version}/xcaddy_${xcaddy_version}_linux_arm64.tar.gz" | tar xzf - -C "/bin" && \
    xcaddy build v${VERSION} --output /caddy-bin \
        --with github.com/mholt/caddy-ratelimit \
        --with github.com/caddy-dns/njalla \
        --with github.com/caddy-dns/cloudflare && \
    chmod 755 "/caddy-bin"


FROM ${UPSTREAM_IMAGE}@${UPSTREAM_DIGEST_ARM64}
EXPOSE 80 443
ARG IMAGE_STATS
ENV IMAGE_STATS=${IMAGE_STATS} CUSTOM_BUILD="" WEBUI_PORTS="80/tcp,80/udp,443/tcp,443/udp"
COPY --from=builder /caddy-bin "${APP_DIR}/caddy"
COPY root/ /
