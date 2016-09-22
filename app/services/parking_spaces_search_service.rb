class ParkingSpacesSearchService
  def self.with_state_on_date(date)
    ParkingSpace.includes(reservations: :user)
                .where(reservations: { reservation_date: date })
                .references(:reservations)
                .order('number asc')
  end
end