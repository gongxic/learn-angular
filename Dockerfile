FROM node as builder
WORKDIR /usr/src/app

RUN npm install
COPY . .
RUN npm run build --prod

FROM nginx
COPY --from=builder /usr/src/app/dist/my-app /usr/share/nginx/html/
COPY --from=builder /usr/src/app/nginx/default.conf /etc/nginx/conf.d/default.conf