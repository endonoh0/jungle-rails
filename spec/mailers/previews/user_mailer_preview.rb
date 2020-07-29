class UserMailerPreview < ActionMailer::Preview
  def order_confirmation
    UserMailer.order_confirmation(User.first, Order.first)
  end
end
