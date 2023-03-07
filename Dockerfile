FROM golang:alpine AS builder
WORKDIR /build
ADD go.mod .
COPY . .
RUN go build -o collectdmqtt_exporter main.go
FROM alpine
WORKDIR /collectdmqtt_exporter_data
COPY --from=builder /build/collectdmqtt_exporter /collectdmqtt_exporter
CMD ["/collectdmqtt_exporter"]
EXPOSE 9393
