FROM ghcr.io/hotio/base@sha256:5a357e8e789f1ac38eab8fe8187d8a6539bc1c41cd5c40f9f3ac9cacaa460cc2

EXPOSE 8080 8443 2019

ENV CUSTOM_BUILD=""

RUN apk add --no-cache nss-tools fail2ban

ARG VERSION
RUN curl -fsSL "https://github.com/caddyserver/caddy/releases/download/v${VERSION}/caddy_${VERSION}_linux_amd64.tar.gz" | tar xzf - -C "${APP_DIR}" && \
    chmod -R u=rwX,go=rX "${APP_DIR}" && \
    ln -s "${APP_DIR}/caddy" "/usr/local/bin/caddy" && \
    cp -R /etc/fail2ban "${APP_DIR}/" && \
    rm -rf /etc/fail2ban && \
    ln -s "${CONFIG_DIR}/fail2ban" "/etc/fail2ban"

COPY root/ /
