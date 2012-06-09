class CompaniesController < InheritedResources::Base
  #layout 'frontend'
  
  def show

    @company = Company.find(params[:id])
    @title = session[:locale] == 'dk' ? @company.title : @company.title_uk
    @headline = session[:locale] == 'dk' ? @company.headline : @company.headline_uk
    @body = session[:locale] == 'dk' ? @company.body : @company.body_uk
    @companies = Company.all
    
    session[:go_to_after_edit] = company_path(@company)
    render :layout => 'frontend'

  end
  
  def update
    go_to = session[:go_to_after_edit] || company_path(@company)
    update!{ go_to }
  end
  
  def create
    create! { admin_index_path }
  end
  
  def destroy
    destroy!{ admin_index_path }
  end

end





