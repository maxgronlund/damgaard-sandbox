class LocalesController < ApplicationController
  
  def create
    
    session[:locale] = params[:locale]
    logger.debug '-----------locale -------------'
    logger.debug session[:locale]
    redirect_to :back
  end
  
end