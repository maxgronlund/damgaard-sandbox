class Admin::CompaniesController < InheritedResources::Base
  load_and_authorize_resource
  def show
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    @pages = Page.all
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
  
  def create
    create! { admin_index_path }
  end
  
  def destroy
    destroy!{ admin_index_path }
  end
  
end
