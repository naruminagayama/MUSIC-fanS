class Song < ApplicationRecord

  mount_uploader :image_id, ImagesUploader
    
  belongs_to :artist
  belongs_to :genre

  # has_many :favorites, dependent: :destroy

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
  
end
