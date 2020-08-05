class Public::CommunitiesController < ApplicationController

  # before_action :authenticate_customer!

  def index
    @communities = Community.all.order(created_at: :desc)
  end

  def show
    @community = Community.find(params[:id])
    @chats = @community.chats
  end

end
