class OwnerCalendarDaySerializer < ActiveModel::Serializer
  attributes :date, :user_id, :free_spaces, :total_spaces, :user_reservation, :parking_space_id

  def free_spaces
    object.user_id.present? ? 0 : 1
  end

  def total_spaces
    1
  end

  def user_reservation
    object.user_id == scope.id
  end

  def parking_space_id
    instance_options[:parking_space_id]
  end
end