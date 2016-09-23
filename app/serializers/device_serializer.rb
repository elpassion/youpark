class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :provider, :token
end