# Stage 1: Build
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./

# Install all dependencies (including devDependencies if needed for build steps)
RUN npm install

COPY . .

# Stage 2: Production
FROM node:20-alpine AS runner

WORKDIR /app

# Create a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy only necessary files from builder
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/src ./src


# Use non-root user
USER appuser

EXPOSE 3000

CMD ["node", "src/app.js"]
