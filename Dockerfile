FROM alpine:latest

ENV VAULT_VERSION 0.1.2

RUN  apk --update add wget \
  && mkdir -p /tmp/src \
  && cd /tmp/src \
  && wget --no-check-certificate https://dl.bintray.com/mitchellh/vault/vault_${VAULT_VERSION}_linux_amd64.zip \
  && unzip vault_${VAULT_VERSION}_linux_amd64.zip \
  && mv vault /usr/local/bin/ \
  && rm -rf /tmp/src \
  && rm -rf /var/cache/apk/*


COPY config.hcl /opt/vault/

EXPOSE 8200

ENTRYPOINT [ "/usr/local/bin/vault" ]
CMD [ "server", "-config=/opt/vault/config.hcl" ]