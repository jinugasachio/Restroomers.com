FROM ruby:2.5.5-stretch
ENV LANG C.UTF-8
RUN ls -al

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    vim \
    mysql-client \
 && rm -rf /var/lib/apt/lists/*\
 && gem install bundler


WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME

ENV RAILS_ENV production
ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY $RAILS_MASTER_KEY


EXPOSE 3000

RUN rm -f tmp/pids/server.pid

CMD ["bundle", "exec", "rails", "s", "puma", "-b", "0.0.0.0", "-p", "3000", "-e", "production"]
