FROM node:18.20.4-alpine3.20
RUN apk upgrade --no-cache \
  && mkdir -p /app

WORKDIR /app
# hadolint ignore=DL3016
RUN npm install -g json-server \
  && mkdir /app/public

EXPOSE 3000
VOLUME [ "/app/public", "/app/db.json" ]
CMD [ "npx", "json-server", "/app/db.json", "--host", "0.0.0.0", "-s", "/app/public"]
