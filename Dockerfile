FROM golang:1.7.3
WORKDIR /build-dir
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:3.10.3
WORKDIR /root/
COPY --from=0 /build-dir/app .
CMD ["./app"]