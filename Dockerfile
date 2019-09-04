FROM ruby:2.5.5-stretch
ENV LANG C.UTF-8


RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    vim \
    mysql-client \
 && rm -rf /var/lib/apt/lists/*\
 && gem install bundler

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs


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

RUN yarn build && yarn start
RUN rm -f tmp/pids/server.pid

CMD ["bundle", "exec", "rails", "s", "puma", "-b", "0.0.0.0", "-p", "3000", "-e", "production"]
