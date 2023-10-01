FROM node:14-slim
ENV TEST_HOST="127.0.0.1"
WORKDIR /app
# Copy package.json to docker image
COPY package*.json  .
# Install all the dependencies
RUN npm ci
# Copy all the directory to docker image workdir
COPY . . 
# Run tests
RUN npm test
EXPOSE 3000
CMD ["npm", "start"]

