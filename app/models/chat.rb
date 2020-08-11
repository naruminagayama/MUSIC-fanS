class Chat < ApplicationRecord
  attr_accessor :current_customer_id

  # after_create_commit {MessageBroadcastJob.perform_later(self)}
  belongs_to :customer, class_name: "Customer", foreign_key: 'customer_id'
  belongs_to :community

  def self.create_via_community_channel(data, params, current_customer_id)
  	create!(message: data["message"], customer_id: current_customer_id, community_id: params['room'])
  	#c = new(self)
  	#c.current_customer_id = current_customer_id
  	Rails.logger.debug '=========================================================='
  	Rails.logger.debug self.inspect
  	Rails.logger.debug self.methods.grep(/current/)
  	Rails.logger.debug '=========================================================='
  	MessageBroadcastJob.perform_later(c)
  end
end
