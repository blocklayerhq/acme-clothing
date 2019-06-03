from alpine:3.9 as builder
run apk update
run apk add npm
run npm config set unsafe-perm true
run apk add gcc g++ make
run apk add python
run ["npm", "install", "-g", "netlify-cli"]
run ["npm", "install", "-g", "netlify-lambda"]
copy ./package.json /src/package.json
run cd /src && npm install @babel/cli
run cd /src && npm install
copy . /src/
# Prod:
# run cd /src && npm run build:client:prod && npm run build:server:prod && netlify-lambda build build/
# Dev:
#run cd /src && npm run build:client && netlify-lambda build src/
run cd /src && npm run build:client
#cmd ["netlify", "deploy", "--prod", "--dir", "public", "--functions", "functions"]
workdir /src
cmd ["netlify", "deploy", "--prod", "--dir", "public"]
