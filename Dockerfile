#this is a dockerfile

FROM            ubuntu:14.04
MAINTAINER      blacksun <sunye1996517@gmail.com>

#change mirro&install ssh server
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"> /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y openssh-server
RUN apt-get clean
RUN mkdir -p /var/run/sshd

#set ssh server passwd
RUN echo "root:123456" | chpasswd 

#install openwrt develop
RUN apt-get install -y subversion build-essential libncurses5-dev zlib1g-dev gawk git ccache gettext libssl-dev xsltproc file
RUN git clone git://git.openwrt.org/openwrt.git

#open 22 port
EXPOSE 22

#make ssh keep running
ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D"]
