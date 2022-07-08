FROM ruby:3.1

WORKDIR /usr/app

COPY . .

RUN bundle install
