class FreeSpaceNotificationService
  def execute(user, date)
    user_ids = User.where(free_space_notifications: true)
                   .where.not(id: Reservation.where(reservation_date: date).pluck(:user_id) << user.id).pluck(:id)
    FreeSpaceNotificationJob.perform_later(user_ids, Apartment::Tenant.current)
  end
end
