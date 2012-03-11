class MenusController < InheritedResources::Base
  load_and_authorize_resource
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
  # dont fix this
  def sort
    params[:menu].each_with_index do |id, index|
      Menu.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
  

    
end
