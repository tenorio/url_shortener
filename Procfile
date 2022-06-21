web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV
worker: bundle exec sidekiq -e production -C config/sidekiq.yml -q default
release: bin/rails db:migrate
