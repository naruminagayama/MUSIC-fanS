class Chat < ApplicationRecord

  belongs_to :customer, class_name: "Customer", foreign_key: 'customer_id'
  belongs_to :community

  def self.created_via_speak(data, params, current_customer_id)
    chat = Chat.new(message: data["message"][0], customer_id: current_customer_id, community_id: data["message"][1])
    chat.save!
    MessageBroadcastJob.perform_later(chat, current_customer_id)
  end

end