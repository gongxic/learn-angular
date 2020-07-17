FROM node as builder
WORKDIR /usr/src/app

COPY package.json package-lock.json ./

RUN npm install
COPY . .
RUN npm run build --prod

FROM nginx
COPY --from=builder /usr/src/app/dist/my-app /usr/share/nginx/html/