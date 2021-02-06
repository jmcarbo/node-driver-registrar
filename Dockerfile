FROM golang:1.15 as build
COPY . /app
RUN cd /app/cmd/csi-node-driver-registrar && go build -o csi-node-driver-registrar .

#FROM gcr.io/distroless/static:latest
FROM ubuntu:20.04
LABEL maintainers="Kubernetes Authors"
LABEL description="CSI Node driver registrar"
ARG binary=./bin/csi-node-driver-registrar

COPY /app/cmd/csi-node-driver-registrar/csi-node-driver-registrar csi-node-driver-registrar
ENTRYPOINT ["/csi-node-driver-registrar"]
