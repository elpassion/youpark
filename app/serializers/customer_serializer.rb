class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug

  def slug
    object.database
  end
end
