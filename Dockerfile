ARG RUBY_VERSION=3.2.2

FROM ruby:$RUBY_VERSION

# Default directory
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

WORKDIR /opt/app

COPY ruby-app/* ./

RUN gem install bundler \
    && bundle install

EXPOSE 80

CMD ["ruby", "http_server.rb"]
