
FROM node:20-alpine

WORKDIR /app

# Install production dependencies
COPY package*.json ./
RUN npm ci --omit=dev

# Copy backend application
COPY . .

ENV NODE_ENV=production

EXPOSE 3200

CMD ["npm", "start"]
