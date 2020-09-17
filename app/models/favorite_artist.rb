class FavoriteArtist < ApplicationRecord

  belongs_to :customer
  belongs_to :artist
  validates :artist_id, uniqueness: { scope: :customer_id }

end