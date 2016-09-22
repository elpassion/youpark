class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :host

  def host
    "#{ENV['APPLICATION_URL']}/c/#{object.database}"
  end
end
