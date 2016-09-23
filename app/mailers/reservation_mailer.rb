class ReservationMailer < ApplicationMailer
  default from: 'system@youpark.herokuapp.com'
  layout 'mailer'

  def confirm(user)
    @user = user
    mail(to: @user.email, subject: 'YouPark - potwierdzenie rezerwacji')
  end

  def free_space(user_id, tenant)
    Apartment::Tenant.switch(tenant) do
      @user = User.find(user_id)
      mail(to: @user.email, subject: 'YouPark - wolne miejsce parkingowe!')
    end
  end
end
