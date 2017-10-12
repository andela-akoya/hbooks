FROM ruby:2.4

MAINTAINER koyagabriel@gmail.com

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY Gemfile /usr/src/app/
ONBUILD COPY Gemfile.lock /usr/src/app/
ONBUILD RUN bundle install

ONBUILD COPY . /usr/src/app

CMD ["bash", "/usr/src/app/run.sh"]
