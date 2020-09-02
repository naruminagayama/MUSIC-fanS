class MessageBroadcastJob < ApplicationJob
  queue_as :default
  
  def perform(chat, current_customer_id)
    # Do something later
    ActionCable.server.broadcast(
      "community_channel",
      message: render_message(chat, current_customer_id),
      publisher: chat.customer.id.to_s
    )
  end

  private

  def render_message(chat, current_customer_id)
    current_customer = Customer.find(current_customer_id)
    ApplicationController.renderer.render(
      partial: 'front/chats/chat',
      locals: { chat: chat, current_customer: current_customer }
    )
  end
end