module Tenant
  module Api
    module V1
      class ReservationsController < ApiController
        before_action :doorkeeper_authorize!

        def index
          params[:reservation_date] ||= Date.today

          parking_spaces = ParkingSpacesSearchService.with_state_for_date(params[:reservation_date])
          render json: parking_spaces, each_serializer: ParkingSpaceStatusSerializer, root: false
        end
      end
    end
  end
end