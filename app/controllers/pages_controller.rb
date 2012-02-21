class PagesController < InheritedResources::Base
  
  belongs_to :company , :optional => true
  
  
  
  def new
    @company = Company.find(params[:company_id])
    @menus = @company.menus
    @breadcrumbs = { "Home" => root_path, 'Admin' => admin_index_path, @company.title.capitalize => admin_company_path(@company) }
    @backdrops = Backdrop.order('title DESC')
    @backdrops_options = @backdrops.map { |backdrop| [backdrop.title, backdrop.id] }
    new!
  end
  
  def edit
    @page = Page.find(params[:id])
    @menus = @page.company.menus
    @menu_options = @menus.map { |menu| [menu.title, menu.id] }
    
    @backdrops = Backdrop.order('title DESC')
    @backdrops_options = @backdrops.map { |backdrop| [backdrop.title, backdrop.id] }
    edit!
  end
  
  #def show
  #  @page = Page.find(params[:id])
  #  render :layout => 'frontend'
  #end
  
  def show
    
    @page = Page.find(params[:id])
    @gallery_image = @page.gallery_images.first
    @title = session[:locale] == 'dk' ? @page.title : @page.title_uk
    @body = session[:locale] == 'dk' ? @page.body : @page.body_uk
    render :layout => 'frontend'
  end
  
  def update
    update! { admin_company_path( @page.company)}
  end
  
  def create
    create! { admin_company_path( @page.company)}
  end
  
  def destroy
    destroy! { admin_company_path( @page.company)}
  end
  
end
