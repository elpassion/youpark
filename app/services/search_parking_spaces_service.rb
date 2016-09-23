class SearchParkingSpacesService
  def execute(date)
    ParkingSpace.includes(reservations: :user)
                .where(reservations: { reservation_date: date })
                .references(:reservations)
                .order('number asc')
  end
end