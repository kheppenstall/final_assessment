class SessionsController < ApplicationController

  skip_before_action :authorize!, only: [:new, :create]

  def new
  end
end