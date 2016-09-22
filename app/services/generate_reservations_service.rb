class GenerateReservationsService
  def initialize(reservation_rule)
    @rule = reservation_rule
  end

  def execute(stop_date)
    [].tap do |reservations|
      @rule.lines.each do |line|
        line.dates(stop_date).each do |date|
          reservations << Reservation.new(
              reservation_date: date,
              parking_space: @rule.parking_space,
              reservation_rule: @rule,
              user: @rule.user
          )
        end
      end
    end
  end

  def execute_and_save!(stop_date)
    Reservation.import execute(stop_date), on_duplicate_key_update: { conflict_target: [:parking_space_id, :reservation_date] }, on_duplicate_key_ignore: true
  end
end