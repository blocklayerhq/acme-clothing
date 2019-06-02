from alpine:3.9 as builder
run apk update
run apk add npm
run npm config set unsafe-perm true
run apk add gcc g++ make
run apk add python
run ["npm", "install", "-g", "netlify-cli"]
copy ./package.json /src/package.json
run cd /src && npm install @babel/cli
run cd /src && npm install
copy . /src/
run cd /src && APP_URL="" npm run build:client
cmd ["netlify", "deploy", "--prod", "--dir=/src", "--functions", "/src/functions"]
workdir /src
