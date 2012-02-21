class MenusController < InheritedResources::Base
  belongs_to :company , :optional => true
  
  def new
    @company = Company.find(params[:company_id])
    @breadcrumbs = { "Home" => root_path, 'Admin' => admin_index_path, @company.title.capitalize => admin_company_path(@company) }
    new!
  end
  
  def edit
    @menu = Menu.find(params[:id])
    @breadcrumbs = { "Home" => root_path, 'Admin' => admin_index_path, @menu.company.title.capitalize => admin_company_path(@menu.company) }
    edit!
  end
  
  def update
    update! { admin_company_path( @menu.company)}
  end
  
  def create
    create! { admin_company_path( @menu.company)}
  end
  
  def destroy
    destroy! { admin_company_path( @menu.company)}
  end  
    
end