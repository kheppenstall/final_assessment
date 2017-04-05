class LinksController < ApplicationController

  before_action :set_link, :set_links

  def index
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

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end

    def set_link
      @link = Link.new
    end

    def set_links
      @links = current_user.links
    end

end
