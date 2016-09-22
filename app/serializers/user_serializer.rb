class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :avatar_url

  def avatar_url
    'http://gifup.com/data/avatars/4169.jpg'
  end
end