# docker-racadm

[![Build Status](https://cloud.drone.io/api/badges/dustinmiller/docker-racadm/status.svg)](https://cloud.drone.io/dustinmiller1337/docker-racadm)

## build

```
docker build -t docker-racadm:latest .
```

## setup alias

```
alias racadm='docker run -it --volume "$(pwd):/tmp" docker-racadm'
```
