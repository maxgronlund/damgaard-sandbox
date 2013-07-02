class Admin::CompaniesController < ApplicationController
  #load_and_authorize_resource
  def show
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    @company = Company.find(params[:id])
    @menus = @company.menus.order("position")
    @pages = Page.all
    session[:go_to_after_edit] = admin_company_path(@company)
    
  end

  def edit
    @company    = Company.find(params[:id])
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path, @company.title.capitalize => admin_company_path(@company) }
    @backdrops = Backdrop.order('title DESC')
    @backdrops_options = @backdrops.map { |backdrop| [backdrop.title, backdrop.id] }
    #   { admin_index_path }
  end
  
  def new
    @company    = Company.new
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    @backdrops = Backdrop.order('title DESC')
    @backdrops_options = @backdrops.map { |backdrop| [backdrop.title, backdrop.id] }
    #new! { admin_index_path }
  end
  
  def update
    #redirect_to :rooth_path
    #go_to = session[:go_to_after_edit] || company_path(@company)
    #update!{ go_to }
    @company = Company.find(params[:id])
    @company.update_attributes(company_params)
    redirect_to company_path(@company)
  end
  
  #def update
  #  @company = Company.find(params[:id])
  #  update_attributes(company_params)
  #  go_to = session[:go_to_after_edit] || admin_company_path(@company)
  #  #update!{ go_to }
  #end
  
  def create
     @company = Company.create(company_params)
    redirect_to admin_index_path
    #create! { admin_index_path }
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




