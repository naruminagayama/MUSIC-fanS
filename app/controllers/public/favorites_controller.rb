class Public::FavoritesController < ApplicationController

  def create
  	artist = Artist.find(params[:artist_id])
  	favorite = current_customer.favorites.new(artist_id: artist.id)
  	favorite.save
  	redirect_to public_artists_path
  end

  def destroy
  	artist = Artist.find(params[:artist_id])
  	favorite = current_customer.favorites.find_by(artist_id: artist.id)
    favorite.destroy
  	redirect_to public_artists_path
  end

  private
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

end
