class CommunityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "community_channel_#{params['community']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  def speak(data)
    Chat.created_via_speak(data, params, current_customer.id)
  end
end