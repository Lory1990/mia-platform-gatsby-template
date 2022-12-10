# Gatsby Template + SSR for Mia Platform
This is a template to be uesd in Mia Platform console to create a new monorepo Frontend application using [Gatsby](https://www.gatsbyjs.com) (React based) withj SSR support.

The microservice comes with one page, the `index` one
```
http://localhost:8000
```
and it implements the technical endpoints for Kubernetes
```
/-/check
/-/healthz
/-/ready
```
and a 404 page (you can edit it into the `pages/404.tsx` file)
## Local development
Make sure you have installed the following tools
* [NodeJs](https://nodejs.org/en/)

Open the terminal in the applciation folder and hit
```
npm run install
npm start
```

## Deploy
The microservice comes with Build&Deploy gitlab pipeline (see `.gitlab-ci.yml`), simply push the code and tag it when you want to deploy.

The build and deploy process complies the application and enables SSR (Server Side Rendering)