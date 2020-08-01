class Public::SongsController < ApplicationController

  def index
  	@songs = Song.all
  end

  def show
  	@song = Song.find(params[:id])
  end

  def search
    @songs = Song.where('name LIKE(?)', "%#{params[:keyword]}%")
  end

end
