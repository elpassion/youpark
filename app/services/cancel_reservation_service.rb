class CancelReservationService
  def execute(user, date)
    Reservation.on_date(date).for_user(user).update_all(user_id: nil, reservation_rule_id: nil)
    FreeSpaceNotificationService.new.execute(user, date)
  end
end
