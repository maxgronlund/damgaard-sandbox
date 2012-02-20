class Admin::CompaniesController < InheritedResources::Base
  
  def show
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    @pages = Page.all
    show!
  end

  def edit
    @company    = Company.find(params[:id])
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path, @company.title => admin_company_path(@company) }
    @backdrops = Backdrop.order('title DESC')
    @backdrops_options = @backdrops.map { |backdrop| [backdrop.title, backdrop.id] }
    edit!
  end
  
  def new
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    @backdrops = Backdrop.order('title DESC')
    @backdrops_options = @backdrops.map { |backdrop| [backdrop.title, backdrop.id] }
    new!
  end
  
end
