
# docker file
### dockerfileosos 子镜像
* centos 7.4.1708
* 安装了nginx supervisor mysql-server mysql beanstalkd redis
### dockerfileofphp
* 配置一些文件
* 启动supervisor进行守护
* 启动容器
-v /var/lib/mysql:/var/lib/mysql \
-v /var/log/nginx:/var/log/nginx \
-v /var/log/beastalkd:/var/log/beastalkd \
-p 22:22 -p 80:80 -p 3306:3306 -p 11301:11301
 