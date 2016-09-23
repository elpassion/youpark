class ReservationMailer < ApplicationMailer

  def confirm(user, tenant)
    Apartment::Tenant.switch(tenant) do
      @user = user
      mail(to: @user.email, subject: 'YouPark - potwierdzenie rezerwacji')
    end
  end
end
