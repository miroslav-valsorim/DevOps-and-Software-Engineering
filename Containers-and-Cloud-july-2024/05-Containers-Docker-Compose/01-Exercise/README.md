# Dockerfile and DockerHub Exercise

docker run -p 8080:8080 -d vue-app

docker build -t vue-app .

docker image tag vue-app miroslavvalsorim/vue-app

docker login

docker push miroslavvalsorim/vue-app

docker inspect image vue:app



> A Vue.js project

## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# lint all *.js and *.vue files
npm run lint

# run unit tests
npm test
```

For more information see the [docs for vueify](https://github.com/vuejs/vueify).
