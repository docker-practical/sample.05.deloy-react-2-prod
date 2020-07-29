# Overview
sample deloy a react application

https://medium.com/bb-tutorials-and-thoughts/how-to-serve-react-application-with-nginx-and-docker-9c51ac2c50ba

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