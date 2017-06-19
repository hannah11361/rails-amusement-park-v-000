class SessionsController < ApplicationController
  def home
    redirect_to user_path(current_user) if logged_in?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Successfully Logged In"
    else
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to root_path
  end

end
