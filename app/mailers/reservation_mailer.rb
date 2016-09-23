class ReservationMailer < ApplicationMailer
  default from: 'system@youpark.herokuapp.com'
  layout 'mailer'

  def confirm(user_id, tenant)
    Apartment::Tenant.switch(tenant) do
      @user = User.find(user_id)
      mail(to: @user.email, subject: '[YouPark] Będziesz korzystał ze swojego miejsca parkingowego?')
    end
  end

  def free_space(user_id, tenant)
    Apartment::Tenant.switch(tenant) do
      @user = User.find(user_id)
      mail(to: @user.email, subject: 'YouPark - wolne miejsce parkingowe!')
    end
  end
end
