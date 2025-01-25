## THIS WILL  BUILD AND COMPILE ASSETS // FIRST STAGE
FROM node:18-alpine as builder 
WORKDIR /app
COPY ./frontend/scss ./scss
COPY ./frontend/css ./css

# THIS WILL INSTALL SASS AND COMPILE IT TO CSS
RUN npm install -g sass 
RUN sass scss/:css/

## this will start STAGE 2
FROM nginx:alpine
COPY --from=builder /app/css /usr/share/nginx/html/css
COPY ./frontend /usr/share/nginx/html
COPY ./docker/nginx.conf /etc/conf.d/default.conf

