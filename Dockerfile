FROM node:24-slim

WORKDIR /usr/src/app

COPY package*.json pnpm-lock.yaml ./
RUN npm install -g pnpm@latest-10 && pnpm install

COPY . .

RUN pnpm build

EXPOSE 3000
CMD ["pnpm", "start"]