class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

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

  def blogs
    @customer = Customer.find(params[:id])
    @blogs = Blog.where(customer_id: customer.id)
                 .order("created_at DESC")
                 .page(params[:page]).per(2)
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, 
                                     :first_name_kana, :email, :nickname, :image_id)
  end

end
