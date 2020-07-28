class Public::BlogsController < ApplicationController

  def index
  	@customer = current_customer
    if params[:id].present?
      @blog = Blog.find(params[:id])
    else
  	  @blog = Blog.new
    end
  	@blogs = Blog.all
  end

  def create
	  @blog = Blog.new(blog_params)
	  @blog.customer_id = current_customer.id
	  @blog.save
    redirect_to public_blogs_path
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
