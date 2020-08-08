class Public::Favorite2sController < ApplicationController

  def create
  	@song = Song.find(params[:song_id])
  	favorite2 = current_customer.favorite2s.new(song_id: @song.id)
  	favorite2.save
  end

  def destroy
  	@song = Song.find(params[:song_id])
  	favorite2 = current_customer.favorite2s.find_by(song_id: @song.id)
    favorite2.destroy
  end

  private
  def song_params
    @song = Song.find(params[:song_id])
  end

end
