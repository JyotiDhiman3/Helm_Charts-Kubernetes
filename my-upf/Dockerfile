FROM ubuntu:20.04

#author sandeep.kumar@truminds.com

ENV TZ=Asia/Kolkata  DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y tzdata && \
    apt-get install -y sudo && \
    apt-get install -y apt-utils && \
    apt-get install -qy build-essential && \
    apt-get install -y libmicrohttpd-dev && \
    apt-get install -y libhiredis-dev && \
    apt-get install -y libssl-dev && \
    apt-get install -y libjansson-dev && \
    apt-get install -y libssl-dev && \
    apt-get install -y libnghttp2-dev &&\
    apt-get install -y libcurl4-openssl-dev && \
    apt-get install -y libxml2-dev && \
    apt-get install -y zlib1g-dev && \
    apt-get install -y iproute2 && \
    apt-get install -y net-tools && \
    apt-get install -y iputils-ping && \
    apt-get install -y tcpdump && \
    apt-get install -y telnet && \
    apt-get install -y nano

RUN echo "25 upf_tun0_table_rx" >> /etc/iproute2/rt_tables && \
    echo "26 upf_tun0_table_tx" >> /etc/iproute2/rt_tables

RUN mkdir -p /home/truCore

ENV LD_LIBRARY_PATH=/usr/lib64:/usr/local/lib:/usr/local/lib64

WORKDIR /home/truCore

#COPY upf_bin_config/upf.out upf_bin_config/dp.cfg upf_bin_config/upf_post_tun.ksh /home/truCore/

CMD ["sleep" "infinity"]

