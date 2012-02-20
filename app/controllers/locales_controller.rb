class LocalesController < ApplicationController
  
  def create
    session[:locale] = params[:locale]
    redirect_to :back
  end
  
end