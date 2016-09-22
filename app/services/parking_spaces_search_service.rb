class ParkingSpacesSearchService
  def self.with_state_for_date(date)
    reservations_query = Reservation.where(reservation_date: date).select(:id)
    ParkingSpace.includes(reservations: :user)
                .where(reservations: { reservation_date: date })
                .references(:reservations)
                .order('number asc')
  end
end