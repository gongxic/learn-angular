FROM node as builder
WORKDIR /usr/src/app

COPY . .
RUN npm install
RUN npm run build

FROM nginx
COPY /dist /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]