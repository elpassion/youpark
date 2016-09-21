class YouParkTenantMiddleware < ::Apartment::Elevators::Generic
  def call(env)
    super
  rescue ::Apartment::TenantNotFound
    [301, {'Location' => "#{ENV['APPLICATION_URL']}/place-for-your-company"}, ['redirect']]
  end
end