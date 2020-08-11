class Public::BlogsController < ApplicationController

  before_action :authenticate_customer!

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
	  @blog.save
    redirect_to public_blogs_path
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    redirect_to public_blogs_path
  end

  def destroy
  	@blog = Blog.find(params[:id])
  	@blog.destroy
  	redirect_to public_blogs_path
  end

  private
  def blog_params
  	params.require(:blog).permit(:title, :content, :image_id, :start_time)
  end

end
