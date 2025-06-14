# Stage 1: Build
FROM node:20-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm ci
RUN npm run lint
COPY . .
RUN npm run build

# Stage 2: Serve with a lightweight server
FROM node:20-alpine AS runner

WORKDIR /app
RUN npm install -g serve
COPY --from=builder /app/dist ./dist

EXPOSE 3000
CMD ["serve", "-s", "dist", "-l", "3000"]