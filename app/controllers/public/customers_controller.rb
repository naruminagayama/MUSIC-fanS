class Public::CustomersController < ApplicationController

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to public_customer_path(@customer.id)
  end

  def follower
    @customer = Customer.find(params[:id])
    @customers = @customer.follower
  end

  def followed
    @customer = Customer.find(params[:id])
    @customers = @customer.followed
  end

  def favoriteartist
    @customer = Customer.find(params[:id])
  end

  def favoritesong
    @customer = Customer.find(params[:id])
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :nickname, :image_id)
  end

end
