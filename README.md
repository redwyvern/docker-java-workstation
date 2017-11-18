![](https://img.shields.io/docker/stars/redwyvern/java-workstation.svg)
![](https://img.shields.io/docker/pulls/redwyvern/java-workstation.svg)
![](https://img.shields.io/docker/automated/redwyvern/java-workstation.svg)
[![](https://images.microbadger.com/badges/image/redwyvern/java-workstation.svg)](https://microbadger.com/images/redwyvern/java-workstation "Get your own image badge on microbadger.com")

Redwyvern Java Development Workstation 
========================================

This is image can be used as a general Java development environment.

This image contains software to build the following type of projects:
* Java

Example YAML file:
```
version: '3'
services:

  java-workstation:
    image: docker.artifactory.weedon.org.au/redwyvern/java-workstation
    hostname: java-workstation
    ports:
      - "2223:22"
    volumes:
      - "/opt/docker-containers/java-workstation/home:/home"
    dns: 192.168.1.50
    networks:
      - dev_nw

networks:
  dev_nw:
```
