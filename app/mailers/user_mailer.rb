class UserMailer < ApplicationMailer
  layout 'mailer'
  default from: 'ben@cookio.co'

  def welcome_email(user)
    @user = user
    @url  = 'localhost:3000'
    mail(to: @user.email,     subject: 'Welcome to My Awesome Site')
  end




end
