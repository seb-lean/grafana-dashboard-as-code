FROM node:18.7.0

WORKDIR /code

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install

COPY . .

# Dont think this is needed
# CMD [ "node", "index.js" ]