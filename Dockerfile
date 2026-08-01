FROM scratch AS downloader

ARG GLADOS_VERSION=0.1

ADD https://github.com/dnhkng/GLaDOS/releases/download/${GLADOS_VERSION}/glados.onnx /glados.onnx
# TODO: Version this one too. For now, the tag seems very old.
ADD https://raw.githubusercontent.com/dnhkng/GLaDOS/refs/heads/main/models/TTS/glados.json /glados.onnx.json

FROM busybox:1.37.0@sha256:9db7b59979c38555a39def84a31fb98b5296952f9e3afd4f6f11f05b07adfab0
COPY --from=downloader --chmod=444 / /glados
