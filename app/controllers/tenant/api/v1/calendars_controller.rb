module Tenant
  module Api
    module V1
      class CalendarsController < ApiController
        before_action :doorkeeper_authorize!

        def show
          dates = {}
          reservations = Reservation.where(reservation_date: Date.today..Date.today+6)
                                    .order(:reservation_date)

          reservations.each do |reservation|
            key = reservation.reservation_date
            dates[key] ||= {free_spaces: 0, total_spaces: 0, user_reservation: false}

            dates[key][:total_spaces] += 1
            dates[key][:free_spaces] += 1 if reservation.user.blank?
            dates[key][:user_reservation] = true if reservation.user == current_user
          end

          render json: {dates: dates}
        end
      end
    end
  end
end
