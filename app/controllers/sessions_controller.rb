class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])

      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Welcome back, #{@user.first_name}!"
      else
        redirect_to login_path, notice: "Email or password is incorrect"
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
