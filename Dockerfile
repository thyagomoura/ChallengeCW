FROM ruby:3.0.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /ChallengeContainer
WORKDIR /ChallengeContainer
ADD Gemfile /ChallengeContainer/Gemfile
ADD Gemfile.lock /ChallengeContainer/Gemfile.lock
RUN gem install rails
RUN gem install bundler -v '2.3.22' && bundle install
ADD . /ChallengeContainer