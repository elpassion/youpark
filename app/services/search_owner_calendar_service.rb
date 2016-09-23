class SearchOwnerCalendarService
  def execute(parking_space, start_on, end_on)
    Reservation.find_by_sql(query(parking_space.id, start_on, end_on))
  end

  private
  def query(parking_space_id, start_on, end_on)
    <<-SQL
      with dates as (
        select * from generate_series('#{start_on}'::date, '#{end_on}'::date ,'1 day') as date
      ),
      dates_without_weekends as (
        select date::date from dates where extract(dow from date) not in (0,6)
      )
      select
        dww.date,
        r.*
      from
        dates_without_weekends dww
        left join reservations r on (r.reservation_date = dww.date and r.parking_space_id = #{parking_space_id})
      order by dww.date asc
    SQL
  end
end