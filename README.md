# Docker SimpleElastix

This is the dockerfile that was used to build the 
*chunglabmit/simpleelastix* image.

[SimpleElastix](https://simpleelastix.github.io/) is a library for biomedical image processing. As stated in the [installation guide](https://simpleelastix.readthedocs.io/GettingStarted.html#compiling-on-linux), compiling it is not a trivial task. A docker image allows faster deployment and iterations.

## Demo code to test installation  
1. Install [Docker engine](https://docs.docker.com/get-docker/)  
2. Pull the image from Docker Hub  
   `docker pull chunglabmit/simpleelastix`
3. Start a container from this image with the demo code mounted,  
   and then run the demo code:  
   `docker run -it -v $PWD/app:/app chunglabmit/simpleelastix /bin/bash /app/run_demo.sh`
4. Results will be saved in the `app` folder for visual inspection
