class CompaniesController < InheritedResources::Base
  #layout 'frontend'
  
  def show
    @company = Company.find(params[:id])
    @title = session[:locale] == 'dk' ? @company.title : @company.title_uk
    @headline = session[:locale] == 'dk' ? @company.headline : @company.headline_uk
    @body = session[:locale] == 'dk' ? @company.body : @company.body_uk
    render :layout => 'frontend'
  end
  
  def update
    update!{ admin_company_path(@company)}
  end

end
