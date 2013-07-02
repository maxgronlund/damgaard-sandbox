class MenusController < ApplicationController
  #load_and_authorize_resource

  
  def new
    @company = Company.find(params[:company_id])
    @breadcrumbs = { "Home" => root_path, 'Admin' => admin_index_path, @company.title.capitalize => admin_company_path(@company) }
    @menu = @company.menus.new
  end
  
  def edit
    @menu = Menu.find(params[:id])
    @breadcrumbs = { "Home" => root_path, 'Admin' => admin_index_path, @menu.company.title.capitalize => admin_company_path(@menu.company) }
      
  end
  

  
  def update
    @menu = Menu.find(params[:id])
    @menu.update_attributes(menu_params)
   redirect_to admin_company_path( @menu.company)
  end
  
  def create
    
    @company = Company.find(params[:company_id])
    @menu = @company.menus.create(menu_params)
  
    redirect_to admin_company_path( @menu.company)
  end
  
  def destroy
    @menu = Menu.find(params[:id])
    go_to = admin_company_path( @menu.company)
    @menu.destroy
    redirect_to go_to
    
  end 
  # dont fix this
  def sort
    params[:menu].each_with_index do |id, index|
      Menu.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
  
  private
    def menu_params
      #if can_edit?
        params.require(:menu).permit!
      #end
    end
    
end
