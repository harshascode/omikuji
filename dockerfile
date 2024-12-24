# Stage 1: Build the application
FROM oven/bun:alpine AS h-build
WORKDIR /app

COPY . /app
RUN bun install --silent
RUN bun run build

# Stage 2: Create a lightweight production image
FROM oven/bun:alpine
WORKDIR /app

COPY --from=h-build /app/package.json /app/package.json
COPY --from=h-build /app/bun.lockb /app/bun.lockb
RUN bun install --production

COPY --from=h-build /app/build /app/build

USER bun

EXPOSE 3000
CMD ["bun", "build/index.js"]


# # Stage 1: Build the application
# FROM node:20-alpine AS h-build
# WORKDIR /app

# COPY . /app
# RUN npm install
# RUN npm run build

# # Stage 2: Create a lightweight production image
# FROM node:20-alpine
# WORKDIR /app

# COPY --from=h-build /app/package.json /app/package.json
# COPY --from=h-build /app/package-lock.json /app/package-lock.json
# RUN npm install --omit=dev

# COPY --from=h-build /app/build /app/build

# USER node

# EXPOSE 3000
# CMD ["node", "build/index.js"]