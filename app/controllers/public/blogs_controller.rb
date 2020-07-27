class Public::BlogsController < ApplicationController

  def index
  	@customer = current_customer
  	@blog = Blog.new
  	@blogs = Blog.all
  end

  def create
	@blog = Blog.new(blog_params)
	@blog.customer_id = current_customer.id
	@blog.save
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
  	params.require(:blog).permit(:title, :content, :image_id)
  end

end
