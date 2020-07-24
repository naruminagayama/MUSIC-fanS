class Song < ApplicationRecord

  mount_uploader :image_id, ImagesUploader
    
  belongs_to :artist
  belongs_to :genre
  
end
