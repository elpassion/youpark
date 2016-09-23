web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
sidekiq: bundle exec sidekiq -c 10 -q default -q mailers
clock: bundle exec clockwork ./config/clock.rb