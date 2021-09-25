FROM golang:1.17.1 as builder

ARG VERSION=latest

RUN go install github.com/Code-Hex/Neo-cowsay/cmd/cowsay@${VERSION}

FROM gcr.io/distroless/static

COPY --from=builder /go/bin/cowsay /usr/bin/cowsay

ENTRYPOINT ["/usr/bin/cowsay"]

