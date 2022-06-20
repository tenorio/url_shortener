web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV
worker: bundle exec sidekiq -e production -c 1 -q default -q mailers
release: bin/rails db:migrate
