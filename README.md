# Sample repository to create multi arch image

## Prerequisite

A builder whose driver is `docker-container`.

```
docker buildx create \
     --name multi-arch-builder \
     --driver docker-container \
     --platform linux/arm64,linux/amd64
```

## Build

```
docker buildx build \
    --builder multi-arch-builder \
    --platform linux/amd64,linux/arm64,linux/arm/v7 \
    -o type=image,push=false \
    -t cowsay:latest \
    --no-cache .
```

