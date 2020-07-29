# Overview
sample deloy a react application

## Dockerize react
https://medium.com/bb-tutorials-and-thoughts/how-to-serve-react-application-with-nginx-and-docker-9c51ac2c50ba

## Deloy with github actions and Heroku
https://dev.to/heroku/deploying-to-heroku-from-github-actions-29ej


# About image
Expose port 3000, 80

# Build image
docker build -t react-app .

# Run on docker
docker run -d --name [naming-app] -p 3000:80 react-app

Ex: docker run -d --name reactapp -p 3000:80 react-app

# Run Watch
$npm run dev

# Run on local
$npm start
