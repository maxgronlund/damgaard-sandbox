class HomeController < ApplicationController
  
  layout 'frontend'
  
  def index
    if Company.all.empty?
      redirect_to admin_index_path
    else
      redirect_to company_path(Company.first.id)
    end
  end

end
