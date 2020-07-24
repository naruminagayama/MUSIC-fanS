class Artist < ApplicationRecord
  
  mount_uploader :image_id, ImagesUploader
  has_many :songs

end
