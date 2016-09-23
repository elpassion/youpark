class ReservationMailer < ApplicationMailer

  def confirm(user_id, tenant)
    Apartment::Tenant.switch(tenant) do
      @user = User.find(user_id)
      mail(to: @user.email, subject: 'YouPark - potwierdzenie rezerwacji')
    end
  end
end
