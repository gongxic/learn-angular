FROM node as builder
WORKDIR /usr/src/app

RUN npm install

COPY . .
RUN npm run build

FROM nginx
COPY /usr/src/app/dist /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]