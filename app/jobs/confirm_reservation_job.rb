class ConfirmReservationJob < ApplicationJob
  queue_as :default

  def perform(tenant)
    WorkingDaysService.configure!

    Apartment::Tenant.switch(tenant) do
      date = Date.tomorrow
      if Clavius.active?(date)
        Reservation.on_date(date).each do |reservation|
          ReservationMailer.confirm(reservation.user_id,tenant).deliver_later
        end
      end
    end
  end
end
