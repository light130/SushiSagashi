FROM ruby:2.6.5-alpine as builder
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        gcc \
        g++ \
        libc-dev \
        libxml2-dev \
        linux-headers \
        postgresql \
        postgresql-dev \
        make && \
    apk add --virtual build-packages --no-cache \
        build-base \
        curl-dev
WORKDIR /sushi_sagashi
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install
RUN apk del build-packages


FROM ruby:2.6.5-alpine
ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo
RUN apk --update add \
    nodejs \
    postgresql \
    postgresql-dev \
    tzdata \
    yarn
WORKDIR /sushi_sagashi
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY . /sushi_sagashi

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["sh", "entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]