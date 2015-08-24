#this is a dockerfile

FROM            ubuntu:14.04
MAINTAINER      blacksun <sunye1996517@gmail.com>

# Install packages
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install gcc g++ binutils patch bzip2 flex bison make autoconf gettext texinfo unzip zip unrar p7zip p7zip-rar p7zip-full sharutils subversion libncurses5-dev ncurses-term zlib1g-dev gawk git-core
RUN apt-get clean 

#git openwrt trunk code
RUN git clone git://git.openwrt.org/openwrt.git


#install and run ssh server
RUNopenssh-server openssh-client
RUN /etc/init.d/ssh restart
CMD ["/usr/sbin/sshd", "-D"]
