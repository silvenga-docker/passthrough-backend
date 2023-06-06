FROM nginx:stable

ENV BACKEND_URL="" \
    BACKEND_HOST="$host" \
    PORT="80"

COPY files/init.sh /init.sh

EXPOSE 80
STOPSIGNAL SIGTERM

CMD ["/bin/sh", "/init.sh"]
