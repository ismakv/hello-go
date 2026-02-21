FROM alpine:3.20

RUN apk add --no-cache ca-certificates

WORKDIR /app

# Replace with your app binary or runtime command
CMD ["sh", "-c", "echo \"Implement me\" && sleep infinity"]
