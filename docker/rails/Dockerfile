FROM ruby:2.7-alpine

ENV APP_PATH /usr/src/app
ENV APP_PACKAGES "bash bash-completion build-base git linux-headers nodejs postgresql-dev tini tzdata yarn"

RUN apk add --no-cache --update $APP_PACKAGES \
    && gem install bundler:2.1.4

WORKDIR $APP_PATH

COPY ["package.json", "yarn.lock", "$APP_PATH/"]
RUN yarn install

COPY ["Gemfile", "Gemfile.lock", "$APP_PATH/"]
RUN bundle install

COPY . $APP_PATH

# Add a script to be executed every time the container starts.
COPY ["docker/rails/entrypoint", "docker/rails/wait-for-it", "/usr/local/bin/"]
RUN chmod +x /usr/local/bin/entrypoint /usr/local/bin/wait-for-it

EXPOSE 3000

ENTRYPOINT ["tini", "--", "entrypoint"]
