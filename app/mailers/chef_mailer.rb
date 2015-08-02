class ChefMailer < ApplicationMailer
  layout 'mailer'
  default from: 'ben@cookio.co'

  def welcome_email(chef)
    @chef = chef
    @url  = 'localhost:3000'
    mail(to: @chef.email,     subject: 'Welcome to Cookio')
  end

end
