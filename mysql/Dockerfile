#Create MySQL Image
FROM mysql:8.0

CMD ["--default-authentication-plugin=mysql_native_password"]

ENV MYSQL_ROOT_PASSWORD: resconi.843
ENV MYSQL_DATABASE: lima_limon
ENV MYSQL_USER: limag6
ENV MYSQL_PASSWORD: resconi.843

ADD ./mysql-data /var/lib/mysql
ADD ./init docker-entrypoint-initdb.d

EXPOSE 3306