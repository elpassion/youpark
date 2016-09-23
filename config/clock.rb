require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)

module Clockwork
  every(1.day, 'youpark.ask_owners', at: '21:00', tz: 'Europe/Warsaw') do
    Customer.all.pluck(:database).each { |database| AskOwnersJob.perform_later(database) }
  end
end