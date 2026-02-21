FROM golang:1.22-alpine AS builder
WORKDIR /src
COPY . .
RUN go build -o /out/app .

FROM alpine:3.20
RUN apk add --no-cache ca-certificates
COPY --from=builder /out/app /usr/local/bin/app
EXPOSE 8080
CMD ["/usr/local/bin/app"]
