class Artist < ApplicationRecord
  
  mount_uploader :image_id, ImagesUploader
  has_many :songs
  belongs_to :community

  has_many :favorites, dependent: :destroy
  
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

end
