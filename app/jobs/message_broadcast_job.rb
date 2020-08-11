class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat)
    # Do something later
    ActionCable.server.broadcast "community_channel_#{chat.community_id}", message: render_message(chat)
  end

  private

    def render_message(chat)
      div_class = chat.customer.id == chat.current_customer_id ? 'chat_right' : 'chat_left'
      ApplicationController.renderer.render partial: 'public/chats/chat', locals: { chat: chat, div_class: div_class }
    end
end
