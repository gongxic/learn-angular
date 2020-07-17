### STAGE 1: Build ###
FROM node as builder
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build --prod

### STAGE 2: Run ###
FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /usr/src/app/dist/my-app /usr/share/nginx/html/