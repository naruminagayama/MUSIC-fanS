class Front::FavoritesController < ApplicationController

  before_action :authenticate_customer!
  before_action(only: %i[create destroy]){artist_params}

  def create
    favorite = current_customer.favorites.new(artist_id: @artist.id)

    begin
      favorite.save!
    rescue => e
      respond_to do |format| 
        format.js {flash.now[:alert] = '登録に失敗しました'}
      end
      logger.error e
      return
    end

    respond_to do |format| 
      format.js {flash.now[:notice] = 'お気に入りに登録しました'}
    end
  end

  def destroy
    favorite = current_customer.favorites.find_by(artist_id: @artist.id)

    begin
      favorite.destroy!
    rescue => e
      respond_to do |format| 
        format.js {flash.now[:alert] = '登録に失敗しました'}
      end
      logger.error e
      return
    end

    respond_to do |format| 
      format.js {flash.now[:notice] = 'お気に入りを解除しました'}
    end
  end

  private
  
  def artist_params
    @artist = Artist.find(params[:artist_id])
  end

end
