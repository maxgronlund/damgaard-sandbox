class AdminController < ApplicationController
  
  def index
    if current_user
      @breadcrumbs = { "Home" => root_path }
      @companies = Company.all
      @users = User.all[1..-1]
      @backdrops = Backdrop.all
    else
      redirect_to root_path
    end
  end
end
