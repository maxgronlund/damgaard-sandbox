class AdminController < ApplicationController
  def index
    @breadcrumbs = { "Home" => root_path }
    @companies = Company.all
    @users = User.all[1..-1]
    @backdrops = Backdrop.all
  end
end
