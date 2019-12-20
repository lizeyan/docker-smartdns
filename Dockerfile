from debian:buster
run echo '\
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free \
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free \
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free \
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free' > /etc/apt/sources.list && \
    sed -i "s/https/http/g" /etc/apt/sources.list && \
    DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install ca-certificates apt-transport-https && \
    sed -i "s/http/https/g" /etc/apt/sources.list && \
    DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install aria2 && \
    aria2c https://github.com/pymumu/smartdns/releases/download/Release28/smartdns.1.2019.12.15-1028.x86_64-debian-all.deb -x 10 -k 1M -o smartdns.deb && \
    dpkg -i smartdns.deb && rm smartdns.deb

add smartdns.conf /etc/smartdns/smartdns.conf

cmd ["smartdns", "-f", "-x", "-c", "/etc/smartdns/smartdns.conf"]
