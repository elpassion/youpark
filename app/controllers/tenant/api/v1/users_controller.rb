module Tenant
  module Api
    module V1
      class UsersController < ApiController
        before_action :doorkeeper_authorize!

        def index
          render json: User.pluck(:email), root: false
        end
      end
    end
  end
end