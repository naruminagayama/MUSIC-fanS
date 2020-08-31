class Artist < ApplicationRecord
  
  mount_uploader :image_id, ImagesUploader
  has_many :songs

  has_many :favorite_artists, dependent: :destroy
  
  def favorited_by?(customer)
    favorite_artists.where(customer_id: customer.id).exists?
  end

end
