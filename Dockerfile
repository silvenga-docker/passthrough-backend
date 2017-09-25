FROM nginx:1.13.5-alpine

ENV BACKEND_URL ""
ENV PORT "80"

COPY files/init.sh /init.sh

EXPOSE 80
STOPSIGNAL SIGTERM

CMD ["/bin/sh", "/init.sh"]