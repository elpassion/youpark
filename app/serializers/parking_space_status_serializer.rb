class ParkingSpaceStatusSerializer < ActiveModel::Serializer
  attributes :id, :number, :taken, :user

  def user
    if object.reservations.first
      UserSerializer.new(object.reservations.first.try(:user)).serializable_hash
    else
      nil
    end
  end

  def taken
    object.reservations.first.try(:user_id).present?
  end
end