FROM nginx:stable-alpine

RUN echo '<!DOCTYPE html> \
    <html> \
    <head>\
    <title>FAST 2025</title>\
    </head>\
    <body>\
    <h1>E ai galera do FAST 2025!</h1>\
    </body>\
    </html>' > /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
