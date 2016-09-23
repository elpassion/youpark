class CreateReservationService
  def execute(user, date, parking_space_id = nil)
    Reservation.transaction do
      reservations = Reservation.free.on_date(date).order(id: :asc)
      reservations = reservations.where(parking_space_id: parking_space_id) unless parking_space_id.nil?

      reservations.lock(true).first.tap do |reservation|
        reservation.update_columns(user_id: user.id) unless reservation.nil?
      end
    end
  end
end