
# Preview all emails at http://localhost:3000/rails/mailers/example_mailer
class ExampleMailerPreview < ActionMailer::Preview
  def sample_user_mail_preview
    UserMailer.welcome_email(User.first)
  end

  def sample_chef_mail_preview
    ChefMailer.welcome_email(Chef.first)
  end

end