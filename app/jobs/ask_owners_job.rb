class AskOwnersJob < ApplicationJob
  queue_as :default

  def perform(tenant)
    WorkingDaysService.configure!

    Apartment::Tenant.switch(tenant) do
      date = Date.tomorrow
      if Clavius.active?(date)
        SearchParkingSpacesService.new.without_reservation_on(date).each do |parking_space|
          parking_space.owners.each do |owner|
            OwnerMailer.make_reservation_email(owner.id, tenant).deliver_later
          end
        end
      end
    end
  end
end
