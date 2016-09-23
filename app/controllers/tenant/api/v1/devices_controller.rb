module Tenant
  module Api
    module V1
      class DevicesController < ApiController
        before_action :doorkeeper_authorize!

        def create
          provider = Device.providers[params[:provider]]
          device = Device.new(user: current_user, token: params[:device_token], provider: provider)
          device.save!

          render json: device
        end
      end
    end
  end
end