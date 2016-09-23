module Tenant
  module Api
    module V1
      class ReservationsController < ApiController
        before_action :doorkeeper_authorize!

        def index
          params[:reservation_date] ||= Date.today

          parking_spaces = SearchParkingSpacesService.new.execute(params[:reservation_date])
          render json: parking_spaces, each_serializer: ParkingSpaceStatusSerializer, root: false
        end

        def create
          reservation = CreateReservationService.new.execute(current_user, params[:reservation_date])
          if reservation.present?
            render json: reservation
          else
            render json: {}, status: 409
          end
        end

        def destroy
          CancelReservationService.new.execute(current_user, params[:reservation_date])
          render json: {}
        end
      end
    end
  end
end