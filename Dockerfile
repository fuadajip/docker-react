FROM node:alpine
LABEL maintaner="fuadajipratomo@gmail.com"
ENV NODE_ENV production

# create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# copy package json to new directory
COPY . /usr/src/app
RUN npm install

# bundle app source
RUN npm run build

# install serve to run application
RUN npm install -g serve

# Set the command to start the node server.
CMD serve -s build

# exposing port
EXPOSE 5000