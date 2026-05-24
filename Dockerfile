FROM scratch AS downloader

ARG GLADOS_VERSION=0.1

ADD https://github.com/dnhkng/GLaDOS/releases/download/${GLADOS_VERSION}/glados.onnx /glados.onnx
# TODO: Version this one too. For now, the tag seems very old.
ADD https://raw.githubusercontent.com/dnhkng/GLaDOS/refs/heads/main/models/TTS/glados.json /glados.onnx.json

FROM busybox:1.37.0@sha256:9532d8c39891ca2ecde4d30d7710e01fb739c87a8b9299685c63704296b16028
COPY --from=downloader --chmod=444 / /glados
