class Blog < ApplicationRecord

  mount_uploader :image_id, ImagesUploader
  acts_as_taggable

end
