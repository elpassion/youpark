class CalendarDaySerializer < ActiveModel::Serializer
  attributes :date, :free_spaces, :total_spaces, :user_reservation

  def date
    object.reservation_date
  end

  def user_reservation
    object.user_ids.include?(scope.id)
  end
end