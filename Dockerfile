# stage1 as builder
FROM node:alpine as builder

# copy the package.json to install dependencies
COPY package.json package-lock.json ./

# Install the dependencies and make the folder
RUN npm install && mkdir /react-app && mv ./node_modules ./react-app

WORKDIR /react-app

COPY . .

# Build the project and copy the files
RUN npm run build


# stage2, based on Nginx, to have only the compiled app, ready for production with Nginx
FROM nginx:alpine

#!/bin/sh
COPY ./.nginx/default.conf.template /etc/nginx/conf.d/default.conf.template
COPY ./.nginx/nginx.conf /etc/nginx/nginx.conf

## Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy from the stage 1
COPY --from=builder /react-app/build /usr/share/nginx/html

EXPOSE 3000 80

# ENTRYPOINT ["nginx", "-g", "daemon off;"]
#CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
CMD /bin/sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'