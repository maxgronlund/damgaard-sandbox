class CompaniesController < InheritedResources::Base
  #layout 'frontend'
  
  def show
    if Company.nil?
      redirect_to admin_index_path
    else 
      @company = Company.find(params[:id])
      @title = session[:locale] == 'dk' ? @company.title : @company.title_uk
      @headline = session[:locale] == 'dk' ? @company.headline : @company.headline_uk
      @body = session[:locale] == 'dk' ? @company.body : @company.body_uk
      render :layout => 'frontend'
    end
  end
  
  def update
    update!{ admin_company_path(@company)}
  end
  
  def destroy
    destroy!{ admin_index_path }
  end

end
