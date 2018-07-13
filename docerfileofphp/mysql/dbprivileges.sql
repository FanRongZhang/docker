use mysql;
select host, user from user;
-- 因为mysql版本是5.7，因此新建用户为如下命令：
--create user xzmmg identified by '123456xzmmg';
-- 将docker_mysql数据库的权限授权给创建的docker用户，密码为123456xzmmg：
--grant all on docker_mysql.* to xzmmg@'%' identified by '123456xzmmg' with grant option;

--avoid insert repeat
insert into user(host,user,password) select '%','xzmmg',password('123456xzmmg') from user where not EXISTS (SELECT 1 from user where user='xzmmg')
-- 这一条命令一定要有：
flush privileges;