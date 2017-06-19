class UsersController < ApplicationController
  before_action :check_autho, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    if !current_user.admin
      redirect_to user_path(current_user), :notice => "Not Admin"
    end
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "Welcome to the theme park!"
    else
        render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
    else
        render :edit
    end
  end

  def delete
  end

  def destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def check_autho
      if !(@user == current_user || current_user.admin)
        redirect_to user_path(set_user), notice: 'Access Denied.'
      end
    end

    def user_params
      params.require(:user).permit(
        :name,
        :password,
        :height,
        :tickets,
        :happiness,
        :nausea,
        :admin
      )
    end
end
