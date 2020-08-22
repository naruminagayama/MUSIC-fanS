class Public::Favorite2sController < ApplicationController

  def create
    @song = Song.find(params[:song_id])
    favorite2 = current_customer.favorite2s.new(song_id: @song.id)
    if favorite2.save
      respond_to do |format| 
        format.js { flash.now[:notice] = 'お気に入りに登録しました' }
      end
      @song = Song.find(params[:song_id])
    else
      logger.error
      respond_to do |format| 
        format.js { flash.now[:alert] = 'エラーが発生しました' }
      end
      @song = Song.find(params[:song_id])
    end
  end

  def destroy
    @song = Song.find(params[:song_id])
    favorite2 = current_customer.favorite2s.find_by(song_id: @song.id)
    if favorite2.destroy
      respond_to do |format| 
        format.js { flash.now[:notice] = 'お気に入りを解除しました' }
      end
      @song = Song.find(params[:song_id])
    else
      logger.error
      respond_to do |format| 
        format.js { flash.now[:alert] = 'エラーが発生しました' }
      end
      @song = Song.find(params[:song_id])
    end
  end

  private
  def song_params
    @song = Song.find(params[:song_id])
  end

end
