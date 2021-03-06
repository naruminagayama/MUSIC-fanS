class Front::SongsController < ApplicationController

  def index
    @songs = Song.all.page(params[:page]).per(6)
    @all_ranks = Song.find(FavoriteSong.group(:song_id).order('count(song_id) desc').limit(3).pluck(:song_id))
    @new_songs = Song.all.order("created_at desc").page(params[:page]).per(4)
    respond_to do |format|
      format.html
      format.js
    end

    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @songs = @genre.songs.page(params[:page]).per(6).order(created_at: :desc).all
      render :genre_songs
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def search
    @songs = Song.where('name LIKE(?)', "%#{params[:keyword]}%")
  end

end
