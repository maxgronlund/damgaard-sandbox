class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  before_filter :set_user_language
  
private 
  def current_user
      @current_user ||= User.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token]
  end
  
  #rescue_from CanCan::AccessDenied do |exception|
  #  #redirect_to no_access_index_path, :alert => exception.message
  #  redirect_to root_path
  #end
  
  def set_user_language
    session[:locale] = session[:locale]  || 'dk'
  end
  
end


