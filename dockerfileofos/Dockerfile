FROM centos:7.4.1708
MAINTAINER zhangrongfang superboss01@163.com

LABEL name="CentOS Image for PHP7.0" \
    vendor="CentOS" \
    license="GPLv2" \
    build-date="20180713"

#时间设置
# 163 yum source
#PHP7的源  webtatic
RUN yum clean all && yum makecache && yum install -y wget &&\
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
 wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo &&\
 rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm &&\
 rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm &&\
 yum install epel-release &&\
#安装依赖
yum -y install gcc gcc-c++\
autoconf wget \
psmisc \
gperftools-devel \
tar \
passwd \
openssl openssl-devel \
openssh-server \
openssh-clients \
initscripts \
unzip pcre pcre-devel zlib zlib-devel git \
libxml2 libxml2-devel curl curl-devel \
libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel \
python-setuptools dos2unix gperf \
libevent libevent-devel bzip2-devel ncurses-devel \
boost libtool boost-devel* libuuid-devel python-sphinx.noarch \
&&\
#安装PHP7
 yum install -y php70w \
 php70w-bcmath \
 php70w-cli \
 php70w-common \
 php70w-fpm \
 php70w-opcache \
 php70w-gd \
 php70w-mysqlnd \
 php70w-mbstring \
 php70w-mcrypt \
 php70w-mysqlnd \
 php70w-pdo \
 php70w-pear \
 php70w-pecl-redis \
 php70w-pecl-memcached \
 php70w-pecl-mongodb \
 php70w-xml  \
 php70w-devel\
 libevent-devel\
&&\
rm -rf /var/cache/yum \
&&\
yum clean all

CMD ["/bin/bash"]