class ReservationMailer < ApplicationMailer

  def confirm(user)
    @user = user
    mail(to: @user.email, subject: 'YouPark - potwierdzenie rezerwacji')
  end
end
