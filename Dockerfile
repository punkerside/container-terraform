FROM alpine:3.17.2

RUN apk update && apk upgrade && apk add --no-cache curl && rm /var/cache/apk/*

RUN curl -s https://releases.hashicorp.com/terraform/1.3.9/terraform_1.3.9_linux_amd64.zip -o terraform_1.3.9_linux_amd64.zip && \
  unzip terraform_1.3.9_linux_amd64.zip && \
  mv terraform /usr/bin/terraform && \
  chmod +x /usr/bin/terraform

WORKDIR /app
ENTRYPOINT [ "/usr/bin/terraform" ]