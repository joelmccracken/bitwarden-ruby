FROM cloudron/base:0.10.0
MAINTAINER Joel McCracken <mccracken.joel@gmail.com>

EXPOSE 4567

RUN mkdir -p /app/code
WORKDIR /app/code

RUN gem install bundler

RUN apt-get update && apt-get install libsqlite3-dev

ADD . /app/code

ENV RACK_ENV production

RUN bundle

CMD [ "/app/code/start.sh" ]
