class Chat < ApplicationRecord

  # after_create_commit {MessageBroadcastJob.perform_later(self)}
  belongs_to :customer, class_name: "Customer", foreign_key: 'customer_id'
  belongs_to :community

  def self.created_via_speak(data, params, current_customer_id)
    chat = Chat.new(message: data["message"], customer_id: current_customer_id, community_id: params['room'])
    chat.save!
    MessageBroadcastJob.perform_later(chat, current_customer_id)
  end

end
