class OwnerMailer < ApplicationMailer
  default from: 'system@youpark.herokuapp.com'
  layout 'mailer'

  def make_reservation_email(owner)
    @user = owner.user
    @parking_space = owner.parking_space

    mail(to: @user.email, subject: '[YouPark] Make reservation for your parking space!')
  end
end
