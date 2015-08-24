#Dockerfile for building OpenWrt with ssh


FROM            gmacario/easy-build
MAINTAINER      blacksun <sunye1996517@gmail.com>


#change mirro&install ssh server


RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y git tig
RUN apt-get install -y mc
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN apt-get install -y screen

#set ssh server passwd
RUN echo "root:root" | chpasswd 


#install openwrt develop
RUN apt-get -y install git-core build-essential libssl-dev
RUN apt-get -y install subversion
RUN apt-get -y install libncurses5-dev gawk python wget
RUN apt-get -y install libxml-parser-perl


#repo openwrt code
RUN cd ~ && git clone git://git.openwrt.org/openwrt.git


#repo feed
RUN cd ~/openwrt && ./scripts/feeds update -a
RUN cd ~/openwrt && ./scripts/feeds install -a


#check
RUN cd ~/openwrt make defconfig
RUN cd ~/openwrt make prereq


#open 22 port
EXPOSE 22


#make ssh keep running
CMD    ["/usr/sbin/sshd", "-D"]


