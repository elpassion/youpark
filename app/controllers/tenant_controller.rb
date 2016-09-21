class TenantController < ApplicationController
  before_action :verify_customer!

  protected
  def current_customer
    @current_customer ||= Customer.find_by(database: Apartment::Tenant.current)
  end

  private
  def verify_customer!
    redirect_to root_path unless current_customer
  end
end
