FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /tweet-search
WORKDIR /tweet-search
COPY Gemfile /tweet-search/Gemfile
COPY Gemfile.lock /tweet-search/Gemfile.lock
RUN bundle install
COPY . /tweet-search
