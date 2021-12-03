FROM ruby:3.0.0
RUN apt-get update -yqq && apt-get install -yqq nodejs npm && npm install -g yarn
WORKDIR /app
COPY ./Gemfile* /app/
RUN bundle install
COPY ./ /app/
RUN yarn install
CMD rails db:setup;./bin/dev;rails s -b 0.0.0.0 
