FROM mhart/alpine-node:12.12

WORKDIR /usr/app

RUN apk update && \
    apk upgrade && \
    apk add git tzdata && \
    git clone https://github.com/ThomPatterson/hue-scene-animation.git && \
    cd hue-scene-animation && \
    npm install && \
    apk del git && \
    rm -rf /tmp/npm*

WORKDIR /usr/app/hue-scene-animation

ENV CONFIG={\"HUE_BRIDGE_ADDRESS\":\"192.168.1.2\",\"HUE_BRIDGE_USERNAME\":\"FAKE40E4QCu88e2aukgHc5dD\",\"DEFAULT_TRANSITION_TIME\":10,\"DEFAULT_TRANSITION_DELAY\":50,\"DEFAULT_ANIMATION\":\"forward\"}

ENV TZ=America/Chicago

EXPOSE 8080

CMD ["npm", "start"]
