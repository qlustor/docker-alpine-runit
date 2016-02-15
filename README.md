[![](https://badge.imagelayers.io/qlustor/nginx-php-fpm.svg)](https://imagelayers.io/?images=qlustor/nginx-php-fpm 'Get your own badge on imagelayers.io')

# Docker: nginx + php-fpm

Docker Nginx & PHP-FPM image built on Alpine Linux micro OS with the final image size of 32 MB vs. 100+ MB compared to the Ubuntu / Debian equivalent. It's intended to be used as a base image for building final app images ready for deployment, but can be used as is and configured via volumes.

# Running

Pull or build the image yourself and run it. Before you do that you'll need to configure Nginx and have the application ready for "dockerisation". Both can be passed using mounted volumes or baked right into the image during the build.

```
# Build
docker build -t qlustor/nginx-php-fpm .

# Or pull
docker pull qlustor/nginx-php-fpm

# Run
docker run -d -p 80:80 -p 443:443 --name nginx-php-fpm qlustor/nginx-php-fpm

# Run with a mounted volume
docker run -d -p 80:80 -p 443:443 -v $PATH:/var/www --name nginx-php-fpm qlustor/nginx-php-fpm
```

## Bonus

```
# Connect to an existing container.
docker exec -ti nginx-php-fpm sh
 
# Remove exited containers.
docker ps -a | grep 'Exited' | awk '{print $1}' | xargs docker rm
 
# Remove intermediary and unused images.
docker rmi $(docker images -aq -f "dangling=true")
```
