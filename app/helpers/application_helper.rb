module ApplicationHelper

  def sold?(quantity)
    quantity === 0 ? true : nil
  end
end
