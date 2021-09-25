FROM gcr.io/distroless/static

ARG TARGETARCH
ARG TARGETVARIANT

COPY ./build/${TARGETARCH}${TARGETVARIANT}/cowsay /usr/bin/cowsay

ENTRYPOINT ["/usr/bin/cowsay"]

