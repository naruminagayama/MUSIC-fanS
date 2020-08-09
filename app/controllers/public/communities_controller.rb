class Public::CommunitiesController < ApplicationController

  # before_action :authenticate_customer!

  def index
    @communities = Community.all.order("name DESC")
  end

  def show
    @community = Community.find(params[:id])
    @chats = @community.chats.page(params[:page]).per(10)
  end

end
