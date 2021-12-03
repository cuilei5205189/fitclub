FROM ruby:3.0.0
RUN apt-get update -y
WORKDIR /myapp
COPY ./Gemfile* /myapp/
RUN bundle install
COPY ./ /myapp/
CMD rm -f tmp/pids/server.pid;rails db:reset;rails s -b 0.0.0.0 
