class FavoriteSong < ApplicationRecord

  belongs_to :customer
  belongs_to :song

end
