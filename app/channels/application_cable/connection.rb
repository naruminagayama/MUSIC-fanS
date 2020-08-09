module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_customer

    def connect
      self.current_customer = find_verified_customer
    end

    private
      def find_verified_customer
        session_key = cookies.encrypted[Rails.application.config.session_options[:key]]
        verified_id = session_key['warden.user.customer.key'][0][0]
        verified_customer = Customer.find_by(id: verified_id)
        # verified_customer = Customer.find_by(id: env['warden'].customer.id)
        return reject_unauthorized_connection unless verified_customer
        verified_customer
      end

  end
end