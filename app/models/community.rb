class Community < ApplicationRecord

  has_many :chats
  has_many :artists
  
end
