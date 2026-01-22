FROM scratch AS downloader

ARG GLADOS_VERSION=0.1

ADD https://github.com/dnhkng/GLaDOS/releases/download/${GLADOS_VERSION}/glados.onnx /glados.onnx
# TODO: Version this one too. For now, the tag seems very old.
ADD https://raw.githubusercontent.com/dnhkng/GLaDOS/refs/heads/main/models/TTS/glados.json /glados.onnx.json

FROM busybox:1.37.0@sha256:b86c79d6d337dcaa4cad3cfc704d5e6ae5ba725f3e0674d96f65af7a8f5e2761
COPY --from=downloader --chmod=444 / /glados
