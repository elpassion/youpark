class CreateReservationRuleService
  def execute(reservation_rule)
    Reservation.transaction do
      reservation_rule.save!
      GenerateReservationsService.new(reservation_rule).execute_and_save!(Date.today + 1.year)
    end
  end
end