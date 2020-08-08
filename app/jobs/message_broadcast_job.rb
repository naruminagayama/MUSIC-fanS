class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat)
    # Do something later
    ActionCable.server.broadcast 'community_channel', message: render_message(chat)
  end

  private

    def render_message(chat)
      ApplicationController.renderer.render partial: 'public/chats/chat', locals: { chat: chat }
    end
end
