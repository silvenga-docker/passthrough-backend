#!/bin/sh

[ -z "${BACKEND_URL}" ] && echo "ERROR: BACKEND_URL must be set (i.e. http://example.com:8080)." && exit 1;

echo "Using backend ${BACKEND_URL}."
envsubst > /etc/nginx/conf.d/default.conf <<EOF
server {
    listen       80;
    server_name  localhost;
    
    location / {
       proxy_pass $BACKEND_URL;
    }
}
EOF

echo "Configurations start."
cat /etc/nginx/conf.d/default.conf
echo "Configurations end."

nginx -g "daemon off;"