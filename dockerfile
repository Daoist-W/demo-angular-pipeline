FROM node:18-slim
WORKDIR /app
COPY . .
RUN npm install
RUN npm audit fix --force
RUN npm run build --prod
FROM nginx:alpine
COPY --from=0 /app/dist/demo-angular-app /usr/share/nginx/html
