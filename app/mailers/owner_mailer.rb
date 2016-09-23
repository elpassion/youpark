class OwnerMailer < ApplicationMailer
  default from: 'system@youpark.herokuapp.com'
  layout 'mailer'

  def make_reservation_email(owner_id, tenant)
    Apartment::Tenant.switch(tenant) do
      @owner = Owner.find(owner_id)
      @user = @owner.user
      @parking_space = @owner.parking_space

      mail(to: @user.email, subject: '[ElParking] Stwórz swoją rezerwację!')
    end
  end
end
