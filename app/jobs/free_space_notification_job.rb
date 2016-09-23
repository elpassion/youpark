class FreeSpaceNotificationJob < ApplicationJob
  queue_as :default

  def perform(user_ids, tenant)
    Apartment::Tenant.switch(tenant) do
      user_ids.each do |user_id|
        ReservationMailer.free_space(user_id, tenant).deliver_later
      end
    end
  end
end
