# Stage 1: Build the application
FROM node:20-alpine AS h-build
WORKDIR /app

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Create a lightweight production image
FROM node:20-alpine
WORKDIR /app
COPY --from=build /app/build ./build
COPY --from=build /app/package.json .
RUN npm install --omit=dev
CMD ["node", "build/index.js"]




# FROM node:20-alpine AS sk-build
# WORKDIR /usr/src/app

# ARG PUBLIC_HELLO

# COPY . /usr/src/app
# RUN npm install
# RUN npm run build

# # Stage 2: Production
# FROM node:20-alpine
# WORKDIR /usr/src/app

# COPY --from=sk-build /usr/src/app/package.json /usr/src/app/package.json
# COPY --from=sk-build /usr/src/app/package-lock.json /usr/src/app/package-lock.json
# RUN npm install --omit=dev

# COPY --from=sk-build /usr/src/app/build /usr/src/app/build

# # Use the default non-root user provided by the base image
# USER node

# EXPOSE 3000
# CMD ["node", "build/index.js"]