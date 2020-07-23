module SalesHelper

  def active_sale?
    @sale = Sale.active.first
  end
end
