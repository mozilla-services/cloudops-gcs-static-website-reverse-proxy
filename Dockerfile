From openresty/openresty:1.19.9.1-5-buster

COPY openresty/ /opt/openresty/

EXPOSE 80

CMD sh -c "                                                                                                     \
    envsubst < /opt/openresty/nginx.conf.template > /usr/local/openresty/nginx/conf/nginx.conf &&               \
    envsubst '\$GCS_BUCKET_URL' < /opt/openresty/default.conf.template > /etc/nginx/conf.d/default.conf &&      \
    /usr/bin/openresty -g 'daemon off;'                                                                         \
"
