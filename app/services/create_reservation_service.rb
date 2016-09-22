class CreateReservationService
  def execute(user, date)
    Reservation.transaction do
      Reservation.free.on_date(date).order(id: :asc).lock(true).first.tap do |reservation|
        reservation.update_columns(user_id: user.id) unless reservation.nil?
      end
    end
  end
end