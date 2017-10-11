FROM ruby:latest

MAINTAINER koyagabriel@gmail.com

WORKDIR /app

ADD . /app

RUN bundle install

ENTRYPOINT ["rails", "server"]
