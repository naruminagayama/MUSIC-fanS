class Front::FavoriteArtistsController < ApplicationController

  before_action :find_artist, only: [:create, :destroy]

  def create
    favorite_artist = current_customer.favorite_artists.new(artist_id: @artist.id)

    begin
      favorite_artist.save!
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
    favorite_artist = current_customer.favorite_artists.find_by(artist_id: @artist.id)

    begin
      favorite_artist.destroy!
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
  
  def find_artist
    @artist = Artist.find(params[:artist_id])
  end

end
