# app/mailers/user_mailer.rb
class ApplicationMailer < ActionMailer::Base
  default from: "jungle.team@jungle.com"
  layout 'mailer'

  def welcome_email(user, userOrder)
    @order = userOrder
    @user = user
    
    mail(to: @user.email, subject: "Your order ##{@order.id} completeded succesfully") if user
  end
end
