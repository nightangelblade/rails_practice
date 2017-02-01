class SessionsController < ApplicationController
  include ApplicationHelper
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    # p@user.authenticate(params[:password])
    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect_to root_path
    else
      render new_session_path
    end
  end


  def destroy
    session.clear
    redirect_to root_path
  end


end

