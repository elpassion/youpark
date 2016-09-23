module Tenant
  module Api
    module V1
      class CalendarsController < ApiController
        before_action :doorkeeper_authorize!

        def show
          reservations = SearchCalendarDaysService.new.execute(Date.today, Date.today + 7.days)
          render json: reservations, each_serializer: CalendarDaySerializer
        end
      end
    end
  end
end
