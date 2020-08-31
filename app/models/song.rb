class Song < ApplicationRecord

  mount_uploader :image_id, ImagesUploader
    
  belongs_to :artist
  belongs_to :genre

  has_many :favorite_songs, dependent: :destroy

  def favorited_by?(customer)
    favorite_songs.where(customer_id: customer.id).exists?
  end
  
end
