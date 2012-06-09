class Admin::CompaniesController < InheritedResources::Base
  load_and_authorize_resource
  def show
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    @company = Company.find(params[:id])
    @menus = @company.menus.order("position")
    @pages = Page.all
    session[:go_to_after_edit] = admin_company_path(@company)
    show!
  end

  def edit
    @company    = Company.find(params[:id])
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path, @company.title.capitalize => admin_company_path(@company) }
    @backdrops = Backdrop.order('title DESC')
    @backdrops_options = @backdrops.map { |backdrop| [backdrop.title, backdrop.id] }
    edit! { admin_index_path }
  end
  
  def new
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    @backdrops = Backdrop.order('title DESC')
    @backdrops_options = @backdrops.map { |backdrop| [backdrop.title, backdrop.id] }
    new! { admin_index_path }
  end
  
  def update
    go_to = session[:go_to_after_edit] || admin_company_path(@company)
    update!{ go_to }
  end
  
  def create
    create! { admin_index_path }
  end
  
  def destroy
    destroy!{ admin_index_path }
  end
  

  
end




