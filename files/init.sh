#!/bin/sh

[ -z "${BACKEND_URL}" ] && echo "ERROR: BACKEND_URL must be set (i.e. http://example.com:8080)." && exit 1;

echo "Using backend ${BACKEND_URL}."
cat > /etc/nginx/conf.d/default.conf <<EOF
server {
    listen       ${PORT};
    server_name  localhost;
    
    location / {
       proxy_pass ${BACKEND_URL};
       proxy_set_header Host \$host;
    }
}
EOF

echo "Configurations start."
cat /etc/nginx/conf.d/default.conf
echo "Configurations end."

nginx -g "daemon off;"