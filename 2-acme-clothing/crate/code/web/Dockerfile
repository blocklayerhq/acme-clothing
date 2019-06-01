from alpine:3.9 as builder
run apk update
run apk add npm
run npm config set unsafe-perm true
run apk add gcc g++ make
run apk add python
run ["npm", "install", "-g", "netlify-cli"]
copy ./package.json /src/package.json
workdir /src
run ["npm", "install"]
copy . /src/
run ["npm", "install"]
run ["npm", "install", "@babel/cli"]
run ["npm", "run", "build:client"]
cmd ["netlify", "deploy", "--prod", "--dir=/src/build"]
