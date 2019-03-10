class UserMailer < ApplicationMailer
  def status_boarding(user)
    @user = user

    mail(to: @user.email, subject: 'FLYZER - Boarding Status')
  end
end
