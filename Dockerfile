FROM node:10-alpine as builder
WORKDIR /usr/src/app

COPY . .
RUN npm install
RUN ng build --prod

FROM nginx
COPY dist/my-app /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]