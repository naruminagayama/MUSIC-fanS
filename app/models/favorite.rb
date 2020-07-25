class Favorite < ApplicationRecord

  belongs_to :customer
  belongs_to :artist
  belongs_to :song

end