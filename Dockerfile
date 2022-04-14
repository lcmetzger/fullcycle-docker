FROM golang:latest AS builder
WORKDIR /app
COPY . .
RUN go mod init hello && go build

FROM scratch
WORKDIR /app
COPY --from=builder /app/hello .
CMD [ "/app/hello" ]
