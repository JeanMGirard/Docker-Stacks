docker build . -t dmnet-proxy:latest


docker run (-it/-d)
  --name dmnet-proxy -p 8080:80 dmnet-proxy:latest nginx
 docker run -it --name dmnet-proxy -p 3000:80 dmnet-proxy:latest nginx
