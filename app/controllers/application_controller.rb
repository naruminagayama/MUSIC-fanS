class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :null_session

  def after_sign_in_path_for(resource)
    case resource
    when Customer
      public_customer_path(current_customer)
    when AdminUser
      admin_comments_path
      stored_location_for(resource) ||
       if resource.is_a?(AdminUser)
         root_path
       else
         super
       end
    end
  end

  def after_sign_out_path_for(resource)
  	root_path
  end

  unless Rails.env.development?
    rescue_from Exception,                        with: :render_500
    rescue_from ActiveRecord::RecordNotFound,     with: :render_404
    rescue_from ActionController::RoutingError,   with: :render_404
  end

  def routing_error
    raise ActionController::RoutingError, params[:path]
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana,
                                                         :first_name_kana, :nickname, :image_id])
    end

  private

  def render_404
    render 'error/404', status: :not_foud
  end

  def render_500
    render 'error/500', status: :internal_server_error
  end

end
