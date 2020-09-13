class Front::CommunitiesController < ApplicationController

  def index
    @communities = Community.all.order("name DESC")
  end

  def show
    @community = Community.find(params[:id])
    @chats = @community.chats.includes(:customer).page(params[:page]).per(10)
  end

  def favorite_index
  end

end
