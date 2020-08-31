class Front::BlogsController < ApplicationController

  before_action :authenticate_customer!
  before_action :blog_find, only: [:edit, :update, :destroy]

  def index
    @customer = current_customer
    @blog = Blog.new
    @blogs = Blog.where(customer_id: current_customer.id)
                 .order("created_at DESC")
                 .page(params[:page]).per(2)
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.customer_id = current_customer.id
    @customer = current_customer
    @blogs = Blog.where(customer_id: current_customer.id)
                 .order("created_at DESC")
                 .page(params[:page]).per(2)

    begin
      @blog.save!
    rescue ActiveRecord::RecordInvalid => e
      flash.now[:alert] = e
        .record
        .errors
        .full_messages[0]
      return render :index
    rescue => e
      flash.now[:alert] = '投稿に失敗しました'
      logger.error e
      return render :index
    end

    flash[:notice] = '記事が投稿されました'
    redirect_to front_blogs_path
  end

  def edit
  end

  def update
    @customer = current_customer
    @blogs = Blog.where(customer_id: current_customer.id)
                 .order("created_at DESC")
                 .page(params[:page]).per(2)

    begin
      @blog.update!(blog_params)
    rescue ActiveRecord::RecordInvalid => e
      flash.now[:alert] = 'タイトルを入力してください'
      return render :index
    rescue => e
      flash.now[:alert] = '更新に失敗しました'
      logger.error e
      return render :index
    end

    flash[:notice] = '記事が更新されました'
    redirect_to front_blogs_path
  end

  def destroy
    begin
      @blog.destroy!
    rescue => e
      flash.now[:alert] = '削除に失敗しました'
      logger.error e
      return render :edit
    end

    flash[:notice] = '記事が削除されました'
    redirect_to front_blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image_id, :start_time)
  end

  def blog_find
    @blog = Blog.find(params[:id])
  end


end