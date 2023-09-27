set -o errexit

bundle install
bundle exec rails assets:precompile RAILS_ENV=production
bundle exec rails assets:clean
bundle exec rails db:migrate

# #!/bin/bash
# set -e


# bundle check || bundle install
# bundle exec rails webpacker:compile
# bundle exec rails assets:clean
# bundle exec rails db:migrate

# # Exit with a success message
# echo "Deployment completed successfully."
