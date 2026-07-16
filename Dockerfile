# Step 1: Build React app
FROM node:20 AS build   # 🔥 changed from node:18 → node:20

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Step 2: Serve with nginx
FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html   # 🔥 vite uses dist not build

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
