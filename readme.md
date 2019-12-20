# SmartDNS docker
A docker image for [SmartDNS](https://github.com/pymumu/smartdns)
## usage
``` bash
docker run --name smartdns -p 10053:53 lizytalk/smartdns
nslookup github.com localhost -port=10053
```
