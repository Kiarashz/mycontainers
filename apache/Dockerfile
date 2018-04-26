FROM ubuntu
ENV http_proxy $http_proxy \
    https_proxy $https_proxy \
    no_proxy $no_proxy
RUN apt update && apt install -y less vim apache2 apache2-doc libapache2-mod-php dnsutils curl
