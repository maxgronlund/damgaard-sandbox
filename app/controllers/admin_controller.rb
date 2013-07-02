class AdminController < ApplicationController
  before_filter :admin_only
  def index
    if current_user
      @breadcrumbs = { "Home" => root_path }
      @companies = Company.all
      @users = User.all[1..-1]
      @contact_people = ContactPerson.all
      @backdrops = Backdrop.all
    else
      redirect_to root_path
    end
  end
end
