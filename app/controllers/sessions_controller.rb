class SessionsController < ApplicationController

  skip_before_action :authorize!, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, success: 'Login successful'
    else
      flash.now[:danger] = 'Name or password incorrect'
      render :new
    end
  end
end
