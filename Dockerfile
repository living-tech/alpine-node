FROM node:14-alpine

LABEL maintainer="NOW ROOM<system@nowroom.jp>"

ENV APP_ROOT=/node

WORKDIR $APP_ROOT

RUN apk update \
  && npm i -g npm \
  && apk add tzdata git \
  && TZ=${TZ:-Asia/Tokyo} \
  && cp /usr/share/zoneinfo/$TZ /etc/localtime \
  && echo $TZ> /etc/timezone \
  && apk del tzdata \
  && rm -rf /var/cache/apk/*
