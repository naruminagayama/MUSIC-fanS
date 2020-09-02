class Front::CustomersController < ApplicationController

  before_action :authenticate_customer!
  before_action :find_customer, only: [:show, :edit, :update, :destroy, :follower,
                                       :followed, :favoriteartist, :favoritesong, :blog]

  def show
  end

  def edit
  end

  def update
    @customer.update(customer_params)
    flash[:notice] = '登録情報が更新されました'
    redirect_to front_customer_path(@customer.id)
  end

  def follower
    @customers = @customer.follower
  end

  def followed
    @customers = @customer.followed
  end

  def favoriteartist
  end

  def favoritesong
  end

  def blog
    @blogs = Blog.order("created_at DESC")
                 .page(params[:page]).per(2)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                     :email, :nickname, :image_id, :password, :password_confirmation)
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end

end
