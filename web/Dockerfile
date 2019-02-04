ARG stage=prod

FROM node:alpine
ENV TERM xterm

RUN apk update && apk upgrade && \
  apk add --no-cache bash git openssh gcc musl-dev yarn

RUN mkdir /web
WORKDIR /web
COPY . /web

RUN yarn global add webpack-dev-server webpack webpack-cli

EXPOSE 8080
CMD ["./init.sh"]
