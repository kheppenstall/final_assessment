class LinksController < ApplicationController

  before_action :set_link, only: [:edit, :update]

  def index
    @link = Link.new
    @links = current_user.links
  end

  def create
    link = current_user.links.new(link_params)
    if link.save
      flash.now[:success] = 'Link added!'
      render partial: 'flash_show', locals: {link: link}, layout: false
    else
      flash.now[:danger] = link.errors.full_messages.first
      render partial: 'shared/flash'
    end
  end

  def edit
  end

  def update
     if @link.update(link_params)
      redirect_to root_path, success: 'Link successfully edited'
    else
      flash.now[:danger] = @link.errors.full_messages.first
      render :edit
    end
  end

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end

    def set_link
      @link = current_user.links.find(params[:id])
    end
end
