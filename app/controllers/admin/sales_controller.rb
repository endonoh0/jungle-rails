class Admin::SalesController < ApplicationController
  http_basic_authenticate_with name: ENV["BASIC_AUTH_USERNAME"], password: ENV["BASIC_AUTH_PASSWORD"]

  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sales_param)

    if @sale.save
      redirect_to [:admin, :sales], notice: 'Sale created! 🤑'
    else
      render :new, notice: "Please fill in the form fields"
    end
  end

  private

  def sales_param
    params.require(:sale).permit(
      :name,
      :starts_on,
      :ends_on,
      :percent_off
    )
  end

end
