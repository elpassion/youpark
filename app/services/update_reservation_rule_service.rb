class UpdateReservationRuleService
  def execute(reservation_rule, attributes)
    Reservation.transaction do
      reservation_rule.update_attributes!(attributes)
      reservation_rule.reservations.since(Date.today).delete_all
      GenerateReservationsService.new(reservation_rule).execute_and_save!(Date.today + 1.year)
    end
  end
end