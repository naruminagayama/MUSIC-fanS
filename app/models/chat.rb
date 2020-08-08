class Chat < ApplicationRecord

  after_create_commit {MessageBroadcastJob.perform_later(self)}
  belongs_to :customer, class_name: "Customer", foreign_key: 'customer_id'
  belongs_to :community

end
