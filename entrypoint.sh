#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Create database if it doesn't exist
bundle exec rails db:prepare

# Execute the container's main process (CMD in Dockerfile)
exec "$@"
