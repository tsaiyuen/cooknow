# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    user = User.last
    #need to somehow make this for each sign-up

    UserMailer.with(user: user).welcome.deliver_now
  end
end
