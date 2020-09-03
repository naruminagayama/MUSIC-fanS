class Front::SessionsController < Devise::SessionsController

  def new_guest
    customer = Customer.guest
    sign_in customer
    redirect_to front_customer_path(current_customer), notice: 'ゲストユーザーとしてログインしました'
  end

end
