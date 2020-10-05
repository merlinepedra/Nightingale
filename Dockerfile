# Pulling the base image
FROM debian:latest
FROM postgres:latest

# Installing Dependencies for kali linux environment
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y python3-pip python3-dev &&\
    cd /usr/local/bin &&\
    ln -s /usr/bin/python3 python &&\
    pip3 install --upgrade pip
    
RUN apt-get install -y git \
    ruby \
    ruby-dev \
    libcurl4-openssl-dev \
    make \
    software-properties-common \
    curl \
    ca-certificates \
    gnupg \
    libz-dev \
    libiconv-hook1 \
    libiconv-hook-dev

RUN gem install nokogiri 

#Working Directory of tools
RUN cd /home/$USER &&\
    mkdir tool-for-pentester &&\
    cd tool-for-pentester

# Installing WP-Scan 
RUN git clone https://github.com/wpscanteam/wpscan.git &&\
    cd wpscan &&\
    gem install bundler && \
    bundle install --without test


# Installing SqlMap
RUN git clone https://github.com/sqlmapproject/sqlmap.git &&\
    cd sqlmap

# Installing Dirbuster
RUN apt-get install -y dirb

#Installing Nmap
RUN apt-get install -y nmap

# Installing Metasploit-framework
RUN git clone https://github.com/rapid7/metasploit-framework.git

# Expose the service ports
EXPOSE 5432
