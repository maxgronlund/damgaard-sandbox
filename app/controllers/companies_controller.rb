class CompaniesController < InheritedResources::Base
  def edit
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    edit!
  end
  def new
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    new!
  end
  
  def update
    update! { admin_index_path}
  end
end
