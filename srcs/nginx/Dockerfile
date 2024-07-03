FROM alpine:3.19

RUN apk update && apk upgrade && apk add --no-cache nginx openssl

RUN mkdir /etc/nginx/ssl && openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/jgoldste.42.fr.crt -keyout /etc/nginx/ssl/jgoldste.42.fr.key -subj "/C=TH/ST=Bangkok/L=Bangkok/O=42Bangkok/OU=jgoldste/CN=jgoldste.42.fr"

EXPOSE 4443

ENTRYPOINT ["nginx"]

CMD ["-g", "daemon off;"]
