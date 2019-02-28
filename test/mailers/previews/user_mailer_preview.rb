# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/status_boarding
  def status_boarding
    user = User.first
    UserMailer.status_boarding(user)
  end
end
