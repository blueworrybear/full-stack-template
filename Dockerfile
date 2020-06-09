FROM node:12-alpine3.12 As builder
RUN apk update && apk upgrade
RUN apk add --no-cache --virtual .build-deps bash gcc musl-dev openssl git go
RUN apk add ca-certificates && update-ca-certificates 2>/dev/null || true
RUN go get -u github.com/bradrydzewski/togo
ENV PATH="/root/go/bin:${PATH}"
COPY . /share/web/
WORKDIR /share/web/web
RUN npm install
WORKDIR /share/web
RUN go generate ./...
RUN go build -o app main.go
RUN apk del .build-deps


FROM python:3.6-alpine3.12
RUN apk update && apk upgrade
RUN apk add --no-cache gettext
WORKDIR /usr/bin
RUN wget https://github.com/containous/traefik/releases/download/v2.2.1/traefik_v2.2.1_linux_amd64.tar.gz
RUN tar -zxvf traefik_v2.2.1_linux_amd64.tar.gz
RUN rm -rf traefik_v2.2.1_darwin_amd64.tar.gz
RUN mkdir -p /etc/traefik
COPY . /share/web/
COPY --from=builder /share/web/app /share/web/
WORKDIR /share/web
RUN cp -rf ./templates/* /etc/traefik
RUN pip install .
ENTRYPOINT [ "/bin/sh", "/share/web/boot.sh" ]
