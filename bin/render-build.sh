# set -o errexit

# bundle install
# bundle exec rake assets:precompile
# bundle exec rake assets:clean
# bundle exec rake db:migrate

# #!/bin/bash
set -e


bundle check || bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate

# Exit with a success message
echo "Deployment completed successfully."
