FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

ARG VITE_API_URL=/api
ENV VITE_API_URL=${VITE_API_URL}

RUN npm run build

RUN npm install -g serve

EXPOSE 80

CMD ["serve", "-s", "dist", "-l", "80"]