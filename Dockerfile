FROM ruby:2.5.1

ENV RAILS_ENV=production
ENV DATABASE_PASSWORD=password
ENV DATABASE_HOST=mysql

COPY . /app

WORKDIR /app

RUN apt-get update && apt-get install -qq -y nodejs && bundle install

CMD ["rails", "server"]
