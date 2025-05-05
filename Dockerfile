FROM golang:1.24 AS stage1
LABEL version="1.0"
LABEL maintainer="Алексей toritsyn.alexei@yandex.ru"
WORKDIR /go/src/pipeline
COPY pipeline.go .
COPY go.mod .
RUN go install .

FROM alpine:3.18
LABEL version="1.0"
LABEL maintainer="Алексей toritsyn.alexei@yandex.ru"
WORKDIR /root/
COPY --from=stage1 /go/bin/pipeline .
ENTRYPOINT ["./pipeline"]

