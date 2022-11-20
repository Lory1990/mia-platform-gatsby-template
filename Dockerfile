FROM node:18

LABEL name="sample-app" \
      description="" \
      eu.mia-platform.url="https://www.mia-platform.eu" \
      eu.mia-platform.version="${npm_package_version}"

ENV HTTP_PORT 3000
ENV COMMIT_SHA "abcd123" 

EXPOSE 3000

WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json", "yarn-lock.json", "./"]
RUN yarn install
RUN yarn global add gatsby-cli
ENV GATSBY_TELEMETRY_DISABLED=1

COPY --chown=node:node . .
RUN chown -R node /usr/src/app
RUN rm -rf .parcel-cache

RUN mkdir -p /usr/static

RUN touch ./off \
  && chmod o+rw ./off \
  && echo "sample-app:$COMMIT_SHA" >> /usr/static/commit.sha
  
USER node
RUN yarn build

CMD ["/bin/bash", "-c", "yarn serve --port=${HTTP_PORT} --host=0.0.0.0"]
