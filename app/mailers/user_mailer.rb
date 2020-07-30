class UserMailer < ApplicationMailer

  default from: "no-reply@jungle.com"

  def order_confirmation(user, order)
    @user = user
    @order = order

    mail(to: "<#{@user}>", subject: "Jungle Rails Order Confirmation ##{@order.id}")
  end
end
