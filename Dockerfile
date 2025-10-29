FROM scratch AS downloader

ARG GLADOS_VERSION=0.1

ADD https://github.com/dnhkng/GLaDOS/releases/download/${GLADOS_VERSION}/glados.onnx /glados.onnx
# TODO: Version this one too. For now, the tag seems very old.
ADD https://raw.githubusercontent.com/dnhkng/GLaDOS/refs/heads/main/models/TTS/glados.json /glados.onnx.json

FROM busybox:1.37.0@sha256:e3652a00a2fabd16ce889f0aa32c38eec347b997e73bd09e69c962ec7f8732ee
COPY --from=downloader --chmod=444 / /glados
