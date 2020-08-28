class Front::RelationshipsController < ApplicationController

  def follow
    current_customer.follow(params[:id])
    redirect_to request.referer
  end

  def unfollow
    current_customer.unfollow(params[:id])
    redirect_to request.referer
  end

end
