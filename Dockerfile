#this is a dockerfile

FROM            ubuntu:12.04
MAINTAINER      blacksun <sunye1996517@gmail.com>

#change mirro&install ssh server
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe"> /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -f -y openssh-server
RUN mkdir -p /var/run/sshd

#set ssh server passwd
RUN echo "root:123456" | chpasswd 

#install openwrt develop
RUN apt-get update
RUN apt-get install -f -y libc6-dev g++ dpkg-dev python-bzrlib python-bzrlib gcj-4.6-jre-headless gcj-4.6-jre-lib ecj-gcj git libc-dev libssl1.0.0 libssl-doc perl liburi-perl libwww-perl python2.7 mercurial-common  build-essential subversion git-core libncurses5-dev zlib1g-dev gawk flex quilt libssl-dev xsltproc libxml-parser-perl mercurial bzr ecj cvs unzip
RUN apt-get clean


#open 22 port
EXPOSE 22

#make ssh keep running
ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D"]
