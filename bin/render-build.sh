#!/usr/bin/env bash
# exit on error
set -o errexit

# NOTE: You can use both 'bundle exec' and 'bin/rails' interchangeably
#    but 'bin/rails' is faster because it doesn't load bundler
#    and it's the recommended way to run rails commands.
#    You can also use 'bundle exec rails' instead of 'bundle exec rake' if you prefer
#    but you will need to add the following to your Gemfile:
#    gem 'rails',
bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate

#  IMPORTANT: In order to make sure this script file is executable, 
#  you need to run the following command: `chmod a+x bin/render-build.sh` in your terminal.
#  What this does is it gives the file executable permissions.

# INFO: When deploying to Render, there's two ways to set up or configure your app:
#  1. You can use the Render Dashboard to set up your app. [Manual Setup](https://render.com/docs/deploy-rails#manual-setup)
#  2. You can add a "render.yaml" at the root of your app to set up your app. [Automatic Setup](https://render.com/docs/deploy-rails#automatic-setup)
# ---------------------------render.yaml [Example]--------------------------------
# databases:
#   - name: postgres
#     ipAllowList: []

# services:
#   - type: web
#     name: rails
#     env: ruby
#     buildCommand: "./bin/render-build.sh"
#     startCommand: bundle exec rails s
#     envVars:
#       - key: RAILS_MASTER_KEY
#         sync: false
#       - key: DATABASE_URL
#         fromDatabase:
#           name: postgres
#           property: connectionString
#   - type: redis
#     name: redis
#     ipAllowList: []
#     plan: free
#     maxmemoryPolicy: noeviction
# ---------------------------render.yaml [Example]--------------------------------
