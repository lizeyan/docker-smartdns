# SmartDNS docker
A docker image for [SmartDNS](https://github.com/pymumu/smartdns)

自带的配置文件只针对在国内的访问

The configuration file is only for those in mainland of China.

## usage
``` bash
docker run --name smartdns -p 10053:53/udp lizytalk/smartdns
nslookup github.com localhost -port=10053
```
