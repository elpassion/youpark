module Tenant
  module Api
    module V1
      class UsersController < ApiController
        before_action :doorkeeper_authorize!

        def show
          render json: current_user, root: false
        end

        def parking_space
          params[:start_on] = Date.parse(params[:start_on]) rescue Date.today
          parking_space = Owner.where(user: current_user).first!.parking_space

          reservations = SearchOwnerCalendarService.new.execute(parking_space, params[:start_on], params[:start_on] + 7.days)
          render json: reservations, each_serializer: OwnerCalendarDaySerializer, parking_space_id: parking_space.id
        end
      end
    end
  end
end