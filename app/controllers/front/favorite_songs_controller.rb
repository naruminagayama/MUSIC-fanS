class Front::FavoriteSongsController < ApplicationController

  before_action :authenticate_customer!
  before_action :song_params, only: [:create, :destroy]

  def create
    favorite_song = current_customer.favorite_songs.new(song_id: @song.id)

    begin
      favorite_song.save!
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
    favorite_song = current_customer.favorite_songs.find_by(song_id: @song.id)

    begin
      favorite_song.destroy!
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

  def song_params
    @song = Song.find(params[:song_id])
  end

end
