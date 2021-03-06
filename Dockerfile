FROM node

# RUN apt-get update
# RUN apt-get install -y git
# RUN apt-get install -y vim

# RUN npm -g i -s --depth=0 yarn

WORKDIR /chokidar-test

# # This installs node_modules in the *image*
# ADD package.json .
# RUN yarn

RUN npm i chokidar
# This creates a volume that contains a copy of node_modules from the image, and mounts it in the container (http://jdlm.info/articles/2016/03/06/lessons-building-node-app-docker.html#the-nodemodules-volume-trick)
VOLUME /chokidar-test/node_modules

CMD bash -li
