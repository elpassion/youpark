class CancelReservationService
  def execute(user, date)
    affected_rows = Reservation.on_date(date).for_user(user).update_all(user_id: nil, reservation_rule_id: nil)
    FreeSpaceNotificationService.new.execute(user, date) if affected_rows > 0
  end
end
