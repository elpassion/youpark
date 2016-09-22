require 'apartment/elevators/generic'
require 'apartment/you_park_tenant_middleware'

Apartment.configure do |config|
  config.excluded_models = %w{ Customer Doorkeeper::Application }
  config.tenant_names = lambda { Customer.pluck(:database) }
  config.use_schemas = true
  config.use_sql = false
end

Rails.application.config.middleware.use 'YouParkTenantMiddleware', lambda { |request|
  if request.path.starts_with?('/c')
    request.path.gsub(/^\/c\//, '').split('/').try(:first)
  else
    nil
  end
}