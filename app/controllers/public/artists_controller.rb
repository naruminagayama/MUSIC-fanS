class Public::ArtistsController < ApplicationController
  
  def index
  	@artists = Artist.all
  end

  def show
  	@artist = Artist.find(params[:id])
  end

  def search
     @artists = Artist.where('name LIKE(?)', "%#{params[:keyword]}%")
     # respond_to do |format|
       # format.html
       # format.json
     # end
  end

end
