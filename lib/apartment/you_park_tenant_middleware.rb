class YouParkTenantMiddleware < ::Apartment::Elevators::Generic
  def call(env)
    super
  rescue ::Apartment::TenantNotFound
    [301, {'Location' => 'http://localhost:3000/place-for-your-company'}, ['redirect']]
  end
end