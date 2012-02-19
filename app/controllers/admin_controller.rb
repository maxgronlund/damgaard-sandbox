class AdminController < ApplicationController
  def index
    @companies = Company.all
    @users = User.all[1..-1]
  end
end
