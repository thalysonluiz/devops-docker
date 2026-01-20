FROM node:24-alpine AS build

WORKDIR /usr/src/app

COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm@latest-10 && pnpm install

COPY . .

RUN pnpm build

# Install production dependencies only
RUN pnpm prune --prod

FROM node:24-alpine AS production

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/package.json ./package.json
COPY --from=build /usr/src/app/tsconfig.json ./tsconfig.json
COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/node_modules ./node_modules


EXPOSE 3000
CMD ["npm", "run", "start:prod"]