class SearchCalendarDaysService
  def execute(start_on, end_on)
    Reservation.select('
            reservation_date,
             count(*) filter (where user_id is null) as free_spaces,
             count(*) as total_spaces,
             array_agg(user_id) filter (where user_id is not null) as user_ids
          ').between_dates(start_on, end_on).group(:reservation_date).order(reservation_date: :asc)
  end
end