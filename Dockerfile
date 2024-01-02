FROM node:lts-alpine3.15

WORKDIR /app

RUN chown -R node:node /app
USER node

COPY --chown=node:node package*.json ./

ENV NODE_ENV=production
RUN npm i
RUN npm ci

COPY --chown=node . ./

RUN ./scripts/build-assets.sh

CMD ["node", "app.js"]