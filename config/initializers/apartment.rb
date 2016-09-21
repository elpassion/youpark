require 'apartment/elevators/subdomain'

Apartment.configure do |config|
  config.excluded_models = %w{ Customer }
  config.tenant_names = lambda { Customer.pluck(:subdomain) }
  config.use_schemas = true
  config.use_sql = false
end

Rails.application.config.middleware.use 'Apartment::Elevators::Subdomain'