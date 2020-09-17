class FavoriteSong < ApplicationRecord

  belongs_to :customer
  belongs_to :song
  validates :song_id, uniqueness: { scope: :customer_id }

end
