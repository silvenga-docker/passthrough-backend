FROM nginx:1.13.5-alpine

ENV BACKEND_URL ""
ENV PORT "80"
ENV RESOLVER "8.8.8.8 ipv6=off"

COPY files/init.sh /init.sh

EXPOSE 80
STOPSIGNAL SIGTERM

CMD ["/bin/sh", "/init.sh"]