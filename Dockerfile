FROM node:18
WORKDIR /app
COPY package.json /app
RUN yarn install && yarn cache clean
EXPOSE 8080
COPY . /app
USER node
CMD [ "yarn", "start" ]