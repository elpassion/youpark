module Tenant
  module Api
    module V1
      class ReservationsController < ApiController
        before_action :doorkeeper_authorize!

        def create
          reservation = CreateReservationService.new.execute(current_user, params[:reservation_date], params[:parking_space_id])
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