#build phase

FROM node:alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

#run phase

RUN nginx

COPY --from=builder /app/build usr/share/nginx/html

#there is no need to start off ngnix as it is already the default command for the instance


