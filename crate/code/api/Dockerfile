from --platform=linux/amd64 alpine:3.12
run apk --update add npm
workdir /src
copy . /src/
run ["npm", "install"]
cmd ["./run.sh"]
