# Validate compose files
FROM docker:29.4.0-cli AS step1

WORKDIR /build

# Copy whole workspace
COPY . .

RUN chmod 775 validateComposeFiles.sh

RUN docker-compose -v && \
  ./validateComposeFiles.sh
