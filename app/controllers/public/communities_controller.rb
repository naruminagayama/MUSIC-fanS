class Public::CommunitiesController < ApplicationController

  # before_action :authenticate_customer!

  def index
    # @communities = Community.all
  end

  def show
    # @community = Community.find(params[:id])
    # @chats = @community.chats
    @chats = Chat.all
  end

end
