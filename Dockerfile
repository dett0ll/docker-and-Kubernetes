#import docker from base image node
FROM node 

#create a working directory. All commands will be run in this directory
WORKDIR /app

#. means all the files in base folder and it will create an app folder in container and copy there
COPY . /app

#as we haave set working directory to app. we can change the above command as

#COPY . ./   -> here ./ means /app

#insall all the dependencies. Usually it is installed in the working directory of container which sis root.
#but we want to keep /app as working directory
RUN npm install

#after this we can usually add

#RUN node server.js -> what this command does is it will run the server directly. We do not want server to
#run in image. we want it run in container so instead we use cmd and it will start it when a container is run
#CMD node server.js
#however syntax for cmd is different. we telling docker to run server.js absed on node image

#if container is listening on port 80, we need to expose that port to our local machine
EXPOSE 80

CMD ["node", "server.js"]