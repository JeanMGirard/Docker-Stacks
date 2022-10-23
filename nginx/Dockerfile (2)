FROM nginx
EXPOSE 80
EXPOSE 403

RUN rm /etc/nginx/conf.d/default.conf

# COPY ./nginx/conf/mime.types /etc/nginx/mime.types
COPY ./nginx/conf/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/conf.d          /etc/nginx/conf.d

COPY ./www /usr/share/nginx/html


# ENV NGINX_HOST=foobar.com
ENV NGINX_PORT=80

CMD ["nginx", "-g", "daemon off;"]
