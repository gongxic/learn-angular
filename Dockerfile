FROM nginx
COPY dist/my-app /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]