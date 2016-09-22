module Tenant
  class ApiController < ActionController::Base
    include CustomerConcern
    protect_from_forgery with: :null_session

    def current_user
      @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
  end
end
