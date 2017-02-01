class SessionsController < ApplicationController
  include ApplicationHelper
  def new
  end

  def create
    p "*" * 25
    p login_params
    @user = User.find_by(login_params)

    if @user
      login(@user)
      redirect_to root_path
    else
      render 'new'
    end
  end


  def destroy
    session.clear
    redirect_to root_path
  end

  private
  def login_params
    params.require(:user).permit(:username, :password)
  end


end

