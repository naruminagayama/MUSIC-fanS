class Chat < ApplicationRecord

  after_create_commit {MessageBroadcastJob.perform_later(self)}
  # belongs_to :customer
  # belongs_to :community

end
