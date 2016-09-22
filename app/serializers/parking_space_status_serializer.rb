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
    object.reservations.length > 0
  end
end