class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
private 
  def current_user
      @current_user ||= User.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token]
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to no_access_index_path, :alert => exception.message
  end
  
#  def mobile_device?
#    if session[:mobile_param]
#      session[:mobile_param] == "1"
#    else
#      request.user_agent =~ /Mobile|webOS/
#    end
#  end
#  helper_method :mobile_device?
#
#  def prepare_for_mobile
#    session[:mobile_param] = params[:mobile] if params[:mobile]
#    request.format = :mobile if mobile_device?
#  end
  
  
end
