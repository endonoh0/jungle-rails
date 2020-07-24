class AboutController < ApplicationController

  def show
    render params[:page]
  end
end
