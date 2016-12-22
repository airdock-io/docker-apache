# Docker Apache  [![](https://images.microbadger.com/badges/image/airdock/apache:latest.svg)](https://microbadger.com/images/airdock/apache:latest "Get your own image badge on microbadger.com")

Docker Image for Apache HTTP server based on airdock/base:jessie

Purpose of this image is:

- provide [Apache Http Server](http://httpd.apache.org/)
- be based on airdock/base:jessie


> Name: airdock/apache


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

Execute

  'docker run -d -p 80:80 -p 443:443 --name apache airdock/apache '


### static content from an external volume


  	'docker run -v /some/content:/var/www/html:ro -d -p 80:80 -p 443:443 --name apache  airdock/apache '


  The user www-data (uid 33) in your container should be known into your host. As it is a standard user, it should be erver present.
  See :
  * [How Managing user in docker container ?](https://github.com/airdock-io/docker-base/wiki/How-Managing-user-in-docker-container)
  * [Common User List](https://github.com/airdock-io/docker-base/wiki/Common-User-List)

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

 Don't forget to add your current user to this new group.


# Change Log


## latest (current)

- add Apache Http server 2.4
- declare environment variable
- MIT license

# Build

- Install "make" utility, and execute: `make build`
- Or execute: 'docker build -t airdock/apache:latest --rm .'

See [Docker Project Tree](https://github.com/airdock-io/docker-base/wiki/Docker-Project-Tree) for more details.



# MIT License

```
The MIT License (MIT)

Copyright (c) 2015 Airdock.io

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
