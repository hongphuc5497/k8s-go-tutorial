FROM golang:1.21.3-alpine AS builder

WORKDIR /compose/hello-docker

COPY main.go main.go

RUN CGO_ENABLED=0 go build -o hello main.go

FROM scratch

ENV COMPOSE_PATH=/compose/hello-docker/hello

ENV BIN_PATH=/usr/local/bin/hello

COPY --from=builder $COMPOSE_PATH $BIN_PATH

ENTRYPOINT ["${BIN_PATH}"]



