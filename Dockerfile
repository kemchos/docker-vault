FROM alpine:latest

ENV VAULT_VERSION v0.2.0.rc1

RUN apk --update add wget \
  && mkdir -p /tmp/src \
  && cd /tmp/src \
  && wget --no-check-certificate https://github.com/hashicorp/vault/releases/download/${VAULT_VERSION}/linux_amd64.zip \
  && unzip linux_amd64.zip \
  && mv vault /usr/local/bin/ \
  && apk del --purge wget \
  && rm -rf /tmp/* /var/cache/apk/*


COPY config.hcl /opt/vault/

EXPOSE 8200

ENTRYPOINT [ "/usr/local/bin/vault" ]
CMD [ "server", "-config=/opt/vault/config.hcl" ]