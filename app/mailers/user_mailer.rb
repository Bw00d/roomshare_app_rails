class UserMailer < ActionMailer::Base
  default from: "no_reply@tweety.com"

  def welcome_message(user)
    @user = user
    mail to: @user.email, subject: 'Welcome to Tweety'
  end
end
