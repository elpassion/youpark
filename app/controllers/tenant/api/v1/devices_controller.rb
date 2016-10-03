module Tenant
  module Api
    module V1
      class DevicesController < ApiController
        before_action :doorkeeper_authorize!

        def create
          provider = Device.providers[params[:provider]]

          device = Device.where(token: params[:device_token], provider: provider).first_or_initialize
          device.user = current_user
          device.save!

          render json: device
        end
      end
    end
  end
end