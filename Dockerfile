# BUILD PHASE
FROM node:alpine

WORKDIR /usr/app

COPY ./package.json .

RUN npm install

COPY ./ ./

RUN npm run build

# RUN PHASE
FROM nginx

EXPOSE 80

COPY --from=0  ./usr/app/build ./usr/share/nginx/html
