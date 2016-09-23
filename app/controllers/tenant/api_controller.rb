module Tenant
  class ApiController < ActionController::Base
    include CustomerConcern
    protect_from_forgery with: :null_session

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def current_user
      @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end

    private
    def record_not_found
      render json: { message: 'Resource with give id is not found' }, status: 404
    end

    def record_invalid(exception)
      render json: { message: exception.message }.merge(errors: exception.record.errors.messages), status: 422
    end
  end
end
