FROM ruby:3.1

WORKDIR /usr/app

COPY Gemfile ./
COPY Gemfile.lock ./

RUN bundle install
COPY . .
