FROM nginx:1.13.5-alpine

ENV BACKEND_URL ""
ENV BACKEND_HOST "$host"
ENV PORT "80"

COPY files/init.sh /init.sh

EXPOSE 80
STOPSIGNAL SIGTERM

CMD ["/bin/sh", "/init.sh"]