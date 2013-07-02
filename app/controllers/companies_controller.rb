class CompaniesController < ApplicationController
  before_filter :admin_only, except:[:show]
  
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
    #redirect_to :rooth_path
    go_to = session[:go_to_after_edit] || company_path(@company)
    #update!{ go_to }
    @company = Company.find(params[:id])
    @company.update_attributes(document_params)
    redirect_to go_to
  end
  
  def new
    @company = Company.new
  end
  
  def create
    #create! { admin_index_path }
    
    @company = @Company.create(company_params)
  end
  
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to admin_index_path
  end
  
  private
    def company_params
      #if can_edit?
        params.require(:company).permit!
      #end
    end

end





