# Docker Apache

Docker Image for Apache HTTP server based on airdock/base:latest

Purpose of this image is:

- provide [Apache Http Server](http://httpd.apache.org/)
- be based on airdock/base:latest


> Name: airdock/apache

***Dependency***: airdock/base:latest



### Volume

This image declare a volume on this path: /var/www


### Enabled Module

- cache
- cache_disk
- expires
- headers
- proxy
- proxy_http
- vhost_alias
- include  
- autoindex



### Environment variables

| Name                 | Default value                     |
|----------------------|-----------------------------------|
| APACHE_RUN_USER 	      | www-data                       |
| APACHE_RUN_GROUP 	      | www-data                       |
| APACHE_PID_FILE 	      | /var/run/apache2/apache2.pid   |
| APACHE_RUN_DIR 	        | /var/run/apache2               |
| APACHE_LOCK_DIR 	      | /var/lock/apache2              |
| APACHE_LOG_DIR 	        | /var/log/apache2               |
| APACHE_ULIMIT_MAX_FILES | ulimit -n 65536                |
| APACHE_SERVERNAME       | fake.server.com                |




# Usage

You should have already install [Docker](https://www.docker.com/).
Download [automated build](https://registry.hub.docker.com/u/airdock/) from public [Docker Hub Registry](https://registry.hub.docker.com/):
`docker search airdock`.


Or execute

  'docker run -d -p 80:80 -p 443:443 --name apache airdock/apache '



### static content from an external volume


  	'docker run -v /some/content:/var/www/html:ro -d -p 80:80 -p 443:443 --name apache  airdock/apache '


  The user www-data (uid 33) in your container should be known into your host. As it is a standard user, it should be erver present.
  See [How Managing user in docker container](https://github.com/airdock-io/docker-base/blob/master/README.md#how-managing-user-in-docker-container) and  [Common User List](https://github.com/airdock-io/docker-base/blob/master/CommonUserList.md).

  If 'www-data' user is not present, you should create it with this uid:gid:

  ```
    sudo groupadd www-data -g 33
    sudo useradd -u 33  --no-create-home --system --no-user-group www-data
    sudo usermod -g www-data www-data
  ```

  And then set owner and permissions on your host directory:

  ```
  	chown -R www-data:www-data /some/content
  ```




# Change Log


## latest (current)

- add Apache Http server 2.4
- declare environment variable


# Build

Alternatively, you can build an image from [Dockerfile](https://github.com/airdock-io/docker-nginx).
Install "make" utility, and execute: `make build`

In Makefile, you could retreive this *variables*:

- NAME: declare a full image name (aka airdock/apache)
- VERSION: declare image version

And *tasks*:

- all: alias to 'build'
- clean: remove all container which depends on this image, and remove image previously builded
- build: clean and build the current version
- tag_latest: tag current version with ":latest"
- release: build and execute tag_latest, push image onto registry, and tag git repository
- debug: launch default command with builded image in interactive mode
- run: run image as daemon and print IP address.



# License

```
 Copyright (c) 1998, 1999, 2000 Thai Open Source Software Center Ltd

 Permission is hereby granted, free of charge, to any person obtaining
 a copy of this software and associated documentation files (the
 "Software"), to deal in the Software without restriction, including
 without limitation the rights to use, copy, modify, merge, publish,
 distribute, sublicense, and/or sell copies of the Software, and to
 permit persons to whom the Software is furnished to do so, subject to
 the following conditions:

 The above copyright notice and this permission notice shall be included
 in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
