FROM node as builder
WORKDIR /usr/src/app

COPY . .
RUN npm install
RUN npm run build

FROM nginx
COPY --from=builder /usr/src/app/dist/my-app /usr/share/nginx/html/
EXPOSE 80