class Blog < ApplicationRecord

  mount_uploader :image_id, ImagesUploader

end
