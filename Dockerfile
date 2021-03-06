FROM ruby:2.6.5-slim

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
  build-essential libpq-dev

ENV INSTALL_PATH /name_generator

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile ./

RUN bundle install

COPY . .

CMD rackup config.ru -o 0.0.0.0