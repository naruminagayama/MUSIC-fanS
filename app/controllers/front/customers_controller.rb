class Front::CustomersController < ApplicationController

  before_action :authenticate_customer!
  before_action :customer_find, only: [:show, :edit, :update, :destroy, :follower,
                                       :followed, :favoriteartist, :favoritesong, :blogs]

  def show
  end

  def edit
  end

  def update
    begin
      @customer.update!(customer_params)
    rescue ActiveRecord::RecordInvalid => e
      flash.now[:alert] = e
        .record
        .errors
        .full_messages
      return render :edit
    rescue => e
      flash.now[:alert] = '更新に失敗しました'
      logger.error e
      return render :edit
    end

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

  def blogs
    @blogs = Blog.where(customer_id: customer.id)
                 .order("created_at DESC")
                 .page(params[:page]).per(2)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                     :email, :nickname, :image_id, :password, :password_confirmation)
  end

  def customer_find
    @customer = Customer.find(params[:id])
  end

end
