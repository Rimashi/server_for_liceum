FROM node:22-bookworm

WORKDIR /app

COPY package*.json ./

RUN npm install --omit=dev

COPY . .

RUN mkdir -p /app/files_from_users /app/files_to_parse \
    && chown -R node:node /app

ENV NODE_ENV=production
ENV PORT=3000

USER node

EXPOSE 3000

CMD ["npm", "start"]