module CustomerConcern
  extend ActiveSupport::Concern

  included do
    before_action :verify_customer!
  end

  def current_customer
    @current_customer ||= Customer.find_by(database: Apartment::Tenant.current)
  end

  def verify_customer!
    redirect_to root_path unless current_customer
  end
end