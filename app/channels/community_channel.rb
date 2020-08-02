class CommunityChannel < ApplicationCable::Channel

  def subscribed
    stream_from "community_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    chat = Chat.create!(message: data['chat'],
                          customer_id: current_customer.id,
                         community_id: params['community_id'])
    render_chat = ApplicationController.renderer.render(partial: 'chats/chat',
                                                        locals: {chat: chat})
    ActionCable.server.broadcast 'community_channel',
                                  chat: render_chat,
                          community_id: params['community_id']
  end

end