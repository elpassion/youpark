module Tenant
  module Api
    module V1
      class UsersController < ApiController
        before_action :doorkeeper_authorize!

        def show
          render json: current_user, root: false
        end
      end
    end
  end
end