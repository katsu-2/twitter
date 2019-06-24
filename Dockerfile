FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs mysql-client
RUN mkdir /twitter
WORKDIR /twitter
COPY Gemfile /twitter/Gemfile
COPY Gemfile.lock /twitter/Gemfile.lock
RUN bundle install
COPY . /twitter

CMD ["rails", "server", "-b", "0.0.0.0"]
