class CommunityChannel < ApplicationCable::Channel
  def subscribed
    #stream_from "community_channel_#{params['community_id']}"
    stream_from "community_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast 'community_channel', message: data['message']
    #Chat.create(message: data["chat"], customer_id: current_customer.id, community: Community.find(params['community_id']))                                  
    Chat.create(message: data["message"], customer_id: current_customer.id, community_id: 2)
  end
end

