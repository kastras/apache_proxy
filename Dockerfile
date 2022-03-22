FROM centos:latest
RUN sed -i -e "s|mirrorlist=|#mirrorlist=|g" /etc/yum.repos.d/CentOS-*
RUN sed -i -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd epel-release
RUN yum install -y certbot mod_ssl
RUN yum update -y
RUN echo "LISTEN 443" >> /etc/httpd/conf/httpd.conf && echo "IncludeOptional conf-ssl.d/*.conf" >> /etc/httpd/conf/httpd.conf
EXPOSE 80
EXPOSE 443
CMD ["httpd", "-DFOREGROUND"]