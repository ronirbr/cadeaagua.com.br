FROM ruby:3.2

ARG user
ARG uid

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm

# Create app directory
RUN mkdir /app
WORKDIR /app

# Create system user
RUN useradd -u ${uid} -ms /bin/bash ${user}
USER ${user}

# Install Rails
RUN gem install rails

# Copy application files
COPY --chown=${user}:${user} . .

# Install dependencies
RUN bundle install

# startup script
COPY --chown=${user}:${user} entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0"]
