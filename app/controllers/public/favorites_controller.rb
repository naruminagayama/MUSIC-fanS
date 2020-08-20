class Public::FavoritesController < ApplicationController

  def create
    @artist = Artist.find(params[:artist_id])
    favorite = current_customer.favorites.new(artist_id: @artist.id)
    favorite.save
  end

  def destroy
    @artist = Artist.find(params[:artist_id])
    favorite = current_customer.favorites.find_by(artist_id: @artist.id)
    favorite.destroy
  end

  private
  def artist_params
    @artist = Artist.find(params[:artist_id])
  end

end
