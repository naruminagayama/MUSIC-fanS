class Front::RelationshipsController < ApplicationController

  def follow
    begin
      current_customer.follow(params[:id])
    rescue => e
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      logger.error e
      return redirect_to request.referer
    end

    flash[:notice] = 'ユーザーをフォローしました'
    redirect_to request.referer
  end

  def unfollow
    begin
      current_customer.unfollow(params[:id])
    rescue => e
      flash.now[:alert] = 'フォローの解除に失敗しました'
      logger.error e
      return redirect_to request.referer
    end

    flash[:notice] = 'フォローを解除しました'
    redirect_to request.referer
  end

end
