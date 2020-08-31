class ChangeFavoritesToFavoriteArtists < ActiveRecord::Migration[5.2]
  def change
  	rename_table :favorites, :favorite_artists
  end
end
