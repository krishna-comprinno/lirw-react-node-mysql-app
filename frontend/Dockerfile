
# Stage 1: Build React application
FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

# Configure backend API URL at build time
ARG VITE_API_URL=/api
ENV VITE_API_URL=${VITE_API_URL}

# Build React application
RUN npm run build

# Stage 2: Serve using Nginx
FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
