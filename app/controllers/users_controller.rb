class UsersController < ApplicationController
  skip_before_action :authorize!, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, success: 'Account created!'
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:password, :email, :password_confirmation)
  end
end