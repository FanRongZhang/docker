FROM zhangrongfang/centos7.4
MAINTAINER zhangrongfang superboss01@163.com
ENV SUPERVISOR_WEB_ADMIN zhangrongfang
ENV SUPERVISOR_WEB_PWD zhangrongfang
ENV GIT_URL https://gitee.com/_-_-_-/ishop2.0.git
ENV USER nginx
ENV GROUP nginx

#安装nginx supervisor
yum -y install nginx supervisor beanstalkd  redis git

# 移除掉软件默认配置文件
RUN rm -f /etc/supervisord.conf &&\
rm -f /etc/nginx/nginx.conf &&\
rm -rf /etc/nginx/conf.d &&\
rm -f /etc/php.ini &&\
#nginx ssl 存放路径
mkdir -p /etc/nginx/ssl &&\
#set the beanstalkd log path for queue data
mkdir -p /var/log/beastalkd &&\
#拷贝项目文件到NGINX运行目录
cd /usr/share/nginx/html && git config --global http.postBuffer 1048576000 &&  git init &&  git remote add origin $GIT_URL &&\
git fetch --all && git reset --hard origin/master &&\
#设置项目运行用户
chown -R $USER:$GROUP /usr/share/nginx/html &&\

# 拷贝配置文件
COPY supervisord.conf /etc/

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/conf.d /etc/nginx/conf.d

COPY php/php.ini /etc/php.ini

COPY redis/redis.conf /etc/redis.conf

#expose the ports
#nginx
EXPOSE 80
#mysql
EXPOSE 3306
#supervisord
EXPOSE 9001
#redis
EXPOSE 6379

CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]

# --privileged -v /nginx_ssl:/etc/nginx/ssl -v /var/log/supervisor:/var/log/supervisor -v /var/log/beastalkd:/var/log/beastalkd -v /var/log/nginx:/var/log/nginx -p 80:80 /usr/sbin/init