class CommunityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "community_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  def speak(data)
  	begin
      Chat.created_via_speak(data, params, current_customer.id)
    rescue => e
      logger.error e
      return
    end
  end
end