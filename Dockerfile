FROM scratch AS downloader

ARG GLADOS_VERSION=0.1

ADD https://github.com/dnhkng/GLaDOS/releases/download/${GLADOS_VERSION}/glados.onnx /glados.onnx
# TODO: Version this one too. For now, the tag seems very old.
ADD https://raw.githubusercontent.com/dnhkng/GLaDOS/refs/heads/main/models/TTS/glados.json /glados.onnx.json

FROM busybox:1.37.0@sha256:d80cd694d3e9467884fcb94b8ca1e20437d8a501096cdf367a5a1918a34fc2fd
COPY --from=downloader --chmod=444 / /glados
