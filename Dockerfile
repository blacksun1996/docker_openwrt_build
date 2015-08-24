#this is a dockerfile

FROM            ubuntu:14.04
MAINTAINER      blacksun <sunye1996517@gmail.com>

#change mirro&install ssh server
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"> /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

#set ssh server passwd
RUN echo "root:123456" | chpasswd 

#install openwrt develop
RUN apt-get install -y gcc g++ binutils patch bzip2 flex bison make autoconf gettext texinfo unzip zip p7zip p7zip-full sharutils subversion libncurses5-dev ncurses-term zlib1g-dev gawk git-core
RUN apt-get clean


#open 22 port
EXPOSE 22

#make ssh keep running
ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D"]
