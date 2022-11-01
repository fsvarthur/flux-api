FROM ruby:3.0.0-alpine

ENV HOME /home/app

RUN mkdir -p $HOME

WORKDIR $HOME

ADD . $HOME
RUN apt-get update && \
    apt-get install -y imagemagick tzdata && \
    apt-get autoremove -y && \
    cp config/database.postgresql.yml config/database.yml && \
    gem install bundler && \
    bundle config set --local deployment 'true' && \
    bundle install --deployment && \
    bundle exec rails assets:precompile 

CMD ["bundle","exec","rails","s" ]
EXPOSE 3000
