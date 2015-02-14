FROM dockerfile/nginx

ADD ./sites-enabled /etc/nginx/sites-enabled
ADD ./conf/nginx.conf /etc/nginx/nginx.conf

