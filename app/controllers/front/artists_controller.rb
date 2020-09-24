class Front::ArtistsController < ApplicationController

  def index
    @artists = Artist.all.page(params[:page]).per(6)
    @all_ranks = Artist.find(FavoriteArtist.group(:artist_id).order('count(artist_id) desc').limit(3).pluck(:artist_id))
    @new_artists = Artist.all.order("created_at desc").page(params[:page]).per(4)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @artist = Artist.find(params[:id])
    @items = RakutenWebService::Ichiba::Item.search(keyword: @artist.name, genreId: '101311')
  end

  def search
    @artists = Artist.where('name LIKE(?)', "%#{params[:keyword]}%")
  end

end
