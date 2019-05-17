class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def recept_email(user, order)
    @user = user
    @order = order
    mail(to: @user, subject: "Order number")
  end

end
