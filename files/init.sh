#!/bin/sh

[ -z "${BACKEND_URL}" ] && echo "ERROR: BACKEND_URL must be set (i.e. http://example.com:8080)." && exit 1;

echo "Using backend ${BACKEND_URL}."
echo "Using host ${BACKEND_HOST}."

cat > /etc/nginx/conf.d/default.conf <<EOF

map \$http_upgrade \$connection_upgrade {
    default          upgrade;
    ''               close;
}

server {
    listen       ${PORT};
    server_name  localhost;

    proxy_buffering off; 

    location / {
        proxy_pass ${BACKEND_URL};
        proxy_set_header Host ${BACKEND_HOST};
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \$connection_upgrade;
    }
}
EOF

echo "Configurations start."
cat /etc/nginx/conf.d/default.conf
echo "Configurations end."

nginx -g "daemon off;"