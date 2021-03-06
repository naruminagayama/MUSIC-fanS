class Front::BlogsController < ApplicationController

  before_action :find_blog, only: [:edit, :update, :destroy]
  before_action :set_customer, only: [:index, :create, :update]

  def index
    @blog = Blog.new
    @blogs = Blog.where(customer_id: current_customer.id)
                 .order("created_at DESC")
                 .page(params[:page]).per(2)
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.customer_id = current_customer.id
    @blogs = Blog.where(customer_id: current_customer.id)
                 .order("created_at DESC")
                 .page(params[:page]).per(2)

    begin
      @blog.save!
    rescue ActiveRecord::RecordInvalid
      flash.now[:alert] = '投稿に失敗しました'
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
    return redirect_to front_blogs_path if @blog.customer_id != current_customer.id
    render :edit
  end

  def update
    return redirect_to front_blogs_path if @blog.customer_id != current_customer.id

    @blogs = Blog.where(customer_id: current_customer.id)
                 .order("created_at DESC")
                 .page(params[:page]).per(2)

    begin
      @blog.update!(blog_params)
    rescue ActiveRecord::RecordInvalid
      flash[:alert] = '更新に失敗しました'
      return redirect_to front_blogs_path
    rescue => e
      flash.now[:alert] = '更新に失敗しました'
      logger.error e
      @blog = Blog.new
      return render :index
    end

    flash[:notice] = '記事が更新されました'
    redirect_to front_blogs_path
  end

  def destroy
    return redirect_to front_blogs_path if @blog.customer_id != current_customer.id

    begin
      @blog.destroy!
    rescue => e
      flash.now[:alert] = '削除に失敗しました'
      logger.error e
      return render :index
    end

    flash[:notice] = '記事が削除されました'
    redirect_to front_blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image_id, :start_time)
  end

  def find_blog
    @blog = Blog.find(params[:id])
  end

  def set_customer
    @customer = current_customer
  end

end
