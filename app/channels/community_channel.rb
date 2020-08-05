class CommunityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "community_channe_#{params['community_id']}"

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Chat.create(message: data["message"], community: Community.find(params['community_id']))                                  
  end
end
