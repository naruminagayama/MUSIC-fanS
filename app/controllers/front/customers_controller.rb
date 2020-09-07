class Front::CustomersController < ApplicationController

  before_action :find_customer, only: [:show, :edit, :update, :destroy, :follower, :followed,
                                       :favoriteartist, :favoritesong, :customerblog]

  def show
  end

  def edit
    if @customer.id == current_customer.id
      render :edit
    else
      redirect_to front_customer_path(current_customer)
    end
  end

  def update
    if @customer.id == current_customer.id

    begin
      @customer.update!(customer_params)
    rescue ActiveRecord::RecordInvalid
      flash.now[:alert] = '登録情報の更新に失敗しました'
      return render :edit
    rescue => e
      flash.now[:alert] = '登録情報の更新に失敗しました'
      logger.error e
      return render :edit
    end

    flash[:notice] = '登録情報が更新されました'
    redirect_to front_customer_path(@customer.id)

    else
      redirect_to front_customer_path(current_customer)
    end
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

  def customerblog
    @blogs = Blog.where(customer_id: find_customer)
                 .order("created_at DESC")
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
