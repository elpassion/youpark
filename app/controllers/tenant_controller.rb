class TenantController < ApplicationController
  include CustomerConcern

  def default_url_options(options = {})
    options.merge({ tenant: Apartment::Tenant.current_tenant })
  end
end
