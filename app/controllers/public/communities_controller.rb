class Public::CommunitiesController < ApplicationController

  # before_action :authenticate_customer!

  def index
    @communities = Community.all
  end

  def show
    #binding.pry
    @community = Community.find(params[:id])
    @chats = @community.chats.recent.limit(5).reverse
  end

end
