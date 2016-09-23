class SearchParkingSpacesService
  def without_reservation_on(date)
    ParkingSpace.where.not(id: Reservation.on_date(date).pluck(:parking_space_id)).includes(:owners)
  end
end