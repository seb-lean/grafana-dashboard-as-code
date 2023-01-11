FROM node:18.7.0

WORKDIR /code

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install

COPY . .

CMD [ "npm", "run", "dev" ]