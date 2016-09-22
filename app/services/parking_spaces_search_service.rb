class ParkingSpacesSearchService
  def self.with_state_for_date(date)
    reservations_query = Reservation.where(reservation_date: date).select(:id)
    ParkingSpace.includes(:reservations)
                .joins("left join reservations on reservations.parking_space_id = parking_spaces.id and reservations.id in (#{reservations_query.to_sql})")
                .order('number asc')
  end
end