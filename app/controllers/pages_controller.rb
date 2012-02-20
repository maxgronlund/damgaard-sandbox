class PagesController < InheritedResources::Base
  
  belongs_to :company , :optional => true
  
  
  
  def new
    @backdrops = Backdrop.order('title DESC')
    @backdrops_options = @backdrops.map { |backdrop| [backdrop.title, backdrop.id] }
    new!
  end
  
  def edit
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
