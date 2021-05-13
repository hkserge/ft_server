FROM debian:buster
EXPOSE 80/tcp
ENV MYSQL_ROOT_PASSWORD 1234
ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y
RUN apt install nginx -y
RUN apt -y install php-mbstring php-zip php-gd wget lsb-release gnupg
# RUN wget -q https://dev.mysql.com/get/mysql-apt-config_0.8.17-1_all.deb
# RUN dpkg -i mysql-apt-config*
RUN apt-get update
RUN echo 'mysql-server-5.7 mysql-server/root_password password $MYSQL_ROOT_PASSWORD' | debconf-set-selections
RUN echo 'mysql-server-5.7 mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD' | debconf-set-selections
RUN apt-get install -y -q mysql-server


# FROM debian:buster
# EXPOSE 80/tcp
# RUN apt update -y
# RUN apt install curl gnupg2 ca-certificates lsb-release -y
# RUN apt install nginx -y
# RUN echo "deb http://nginx.org/packages/debian `lsb_release -cs` nginx" \
#     | tee /etc/apt/sources.list.d/nginx.list
# RUN echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
#     | tee /etc/apt/preferences.d/99nginx
# RUN curl -o /tmp/nginx_signing.key https://nginx.org/keys/nginx_signing.key
# RUN mv /tmp/nginx_signing.key /etc/apt/trusted.gpg.d/nginx_signing.asc
# RUN apt update -y
