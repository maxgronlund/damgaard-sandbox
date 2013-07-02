class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  before_filter :set_user_language
  
  def can_edit?
    user_signed_in? && current_user.admin_or_super?
  end
  
  def admin_only
    if user_signed_in? && current_user.admin_or_super?
    else
      forbidden
    end
  end
  
private 
  def current_user
      @current_user ||= User.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token]
  end
  
  def user_signed_in?
    current_user != nil
  end
  
  #rescue_from CanCan::AccessDenied do |exception|
  #  #redirect_to no_access_index_path, :alert => exception.message
  #  redirect_to root_path
  #end
  
  def set_user_language
    session[:locale] = session[:locale]  || 'dk'
  end
  
  def forbidden
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  end
  helper_method :forbidden
  
end


