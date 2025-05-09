FROM oven/bun:1.2.10-slim

WORKDIR /app

COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

ENV NODE_ENV=production

ARG VERSION
ENV VITE_VERSION=$VERSION

COPY public ./public
RUN echo "{ \"version\": \"${VERSION}\" }" > ./public/version.json

COPY index.html ./
COPY tsconfig.json ./
COPY vite.config.ts ./
COPY src ./src
COPY server ./server

RUN bun run build

EXPOSE 8000

CMD ["bun", "start:server"]
