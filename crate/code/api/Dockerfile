from alpine as api
run apk update
run apk add npm
run npm config set unsafe-perm true
run apk add gcc g++ make
run apk add python
run ["npm", "install", "-g", "nodemon"]
run ["npm", "install", "-g", "babel-cli"]
copy . /src/
workdir /src
run npm install
run npm run build:prod
env NODE_ENV=production
cmd ["npm", "run", "start:server"]
