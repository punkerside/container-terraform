FROM alpine:3.18.2

RUN apk update && apk upgrade && apk add --no-cache curl=8.1.2-r0 && rm /var/cache/apk/*

RUN curl -s https://releases.hashicorp.com/terraform/1.5.2/terraform_1.5.2_linux_amd64.zip -o terraform_1.5.2_linux_amd64.zip && \
  unzip terraform_1.5.2_linux_amd64.zip && \
  mv terraform /usr/bin/terraform && \
  chmod +x /usr/bin/terraform

WORKDIR /app
ENTRYPOINT [ "/usr/bin/terraform" ]