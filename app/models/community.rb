class Community < ApplicationRecord

  # has_many :customer_communities
  # has_many :customers, through: :customer_communities
  # has_many :chats
  has_many :artists
  
end
