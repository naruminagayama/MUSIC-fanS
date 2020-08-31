class ChangeFavorite2sToFavoriteSongs < ActiveRecord::Migration[5.2]
  def change
  	rename_table :favorite2s, :favorite_songs
  end
end
