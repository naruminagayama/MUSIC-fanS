class Front::RelationshipsController < ApplicationController

  before_action :authenticate_customer!

  def follow
    current_customer.follow(params[:id])
    flash[:notice] = 'ユーザーをフォローしました'
    redirect_to request.referer
  end

  def unfollow
    current_customer.unfollow(params[:id])
    flash[:notice] = 'フォローを解除しました'
    redirect_to request.referer
  end

end
