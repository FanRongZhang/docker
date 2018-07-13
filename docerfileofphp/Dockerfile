FROM zhangrongfang/centos7.4
MAINTAINER zhangrongfang superboss01@163.com
ENV SUPERVISOR_WEB_ADMIN zhangrongfang
ENV SUPERVISOR_WEB_PWD zhangrongfang

# romove the origin configs
RUN chown -R nginx:nginx /usr/share/nginx/html &&\
rm -f /etc/supervisord.conf &&\
rm -f /etc/nginx/nginx.conf &&\
rm -rf /etc/nginx/conf.d &&\
rm -f /etc/php.ini

# put my configs into the container
COPY supervisord.conf /etc/
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/conf.d /etc/nginx/conf.d
COPY php/php.ini /etc/php.ini
COPY redis/redis /etc/myredis.conf

#作为一个发布产品可以先将整个PHP项目打进容器NIGNX ROOT
#后续的更新看是不是可以借助其他工具进行更新容器宿主主机上映射给容器/usr/share/nginx/html下面的文件
#ADD http://xxxdjfkas.git  /usr/share/nginx/html



#将所需文件放到容器中
COPY mysql/dbsetup.sh /mysql/setup.sh
COPY mysql/db.sql /mysql/schema.sql
COPY mysql/dbprivileges.sql /mysql/privileges.sql

#设置数据库
RUN chmod +x /mysql/setup.sh &&\
/mysql/setup.sh &&\
#set the beanstalkd log path for queue data
mkdir -p /var/log/beastalkd \

#expose the ports
#nginx
EXPOSE 80
#ssh
EXPOSE 22
#mysql
EXPOSE 3306
#beanstalkd
EXPOSE 11301
#redis
EXPOSE 6379
#supervisord
EXPOSE 9001

CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]

# -v /var/lib/mysql:/var/lib/mysql -v /var/log/nginx:/var/log/nginx -v /var/log/beastalkd:/var/log/beastalkd -p 22:22 -p 80:80 -p 3306:3306 -p 11301:11301