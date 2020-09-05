FROM ruby:2.6.2
LABEL George Asfour <archmage09@gmail.com>
ARG secret_token

# Fix timezone issues
RUN rm -f /etc/localtime
RUN ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -qy nodejs
RUN gem install bundler -v '1.17.3'

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

COPY ./ .
RUN cp config/database.yml.sample config/database.yml

ENV RAILS_ENV=production
ENV SECRET_KEY_BASE=$secret_token
RUN bundle exec rake assets:precompile

CMD rails db:migrate && rails server -b 0.0.0.0
