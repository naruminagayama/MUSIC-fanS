class Chat < ApplicationRecord

  belongs_to :customer
  belongs_to :community
  validates :message, presence: true
  scope :recent, -> { order(created_at: :desc)}

end
