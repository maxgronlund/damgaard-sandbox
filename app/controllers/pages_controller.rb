class PagesController < ApplicationController
  before_filter :admin_only, except:[:show]
  
  def index

    
    @menu     = Menu.find(params[:menu_id])
    @company  = Company.find(params[:company_id])
    @pages    = @company.pages
    
  end
  
  def new
    @menu = Menu.find(params[:menu_id])
    @company = @menu.company
    #@menus = @company.menus
    @breadcrumbs = { "Home" => root_path, 'Admin' => admin_index_path, @company.title.capitalize => admin_company_path(@company) }
    @backdrops = Backdrop.order('title DESC')
    @backdrops_options = @backdrops.map { |backdrop| [backdrop.title, backdrop.id] }
    @page = Page.new
  end
  
  
  def edit
    @menu = Menu.find(params[:menu_id])
    @page = Page.find(params[:id])
    #@menus = @page.company.menus
    #@menu_options = @menus.map { |menu| [menu.title, menu.id] }
    
    @breadcrumbs = { "Home" => root_path, 'Admin' => admin_index_path, @page.company.title.capitalize => admin_company_path(@page.company) }
    
    @backdrops = Backdrop.order('title DESC')
    @backdrops_options = @backdrops.map { |backdrop| [backdrop.title, backdrop.id] }
    
      
  end
  
  def show
    
    @page = Page.find(params[:id])
    case session[:locale]
    when 'de'
      @title = @page.title_de
      @body = @page.body_de
    when 'en'
      @title =  @page.title_uk
      @body = @page.body_uk
    when 'no'
      @title =  @page.title_no
      @body = @page.body_no
    when 'se'
      @title =  @page.title_se
      @body = @page.body_se
    when 'dk'
      @title =  @page.title
      @body = @page.body
    else
      @title =  @page.title
      @body = @page.body
    end
  
    
    session[:go_to_after_edit] = page_path(@page)
    
    render :layout => 'frontend'
  end
  
  def update
    go_to = session[:go_to_after_edit] || company_menu_pages_path( @page.company, @page.menu)
    @page = Page.find(params[:id])
    @page.update_attributes(page_params)
    redirect_to go_to
    # 
  end
  
  def create
    @menu = Menu.find(params[:menu_id])
    @menu.pages.create(page_params)
    
    #redirect_to admin_company_path( @page.company)
    redirect_to company_menu_pages_path(@menu.company, @menu)
  end
  
  def destroy
    @menu = Menu.find(params[:menu_id])
    @page = Page.find(params[:id])
    
    go_to = company_menu_pages_path( @page.company, @page.menu)
    @page.delete
    redirect_to go_to
  end
  
  def index
    @menu = Menu.find(params[:menu_id])
    @pages = @menu.pages.order("position")
    go_to = session[:go_to_after_edit] = company_menu_pages_path( @menu.company, @menu)
    @breadcrumbs = { "Home" => root_path, 'Admin' => admin_index_path, @menu.company.title.capitalize => admin_company_path(@menu.company) }
  end

  def sort
    params[:page].each_with_index do |id, index|
      Page.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
  
  private
    def page_params
      #if can_edit?
        params.require(:page).permit!
      #end
    end
  
end
