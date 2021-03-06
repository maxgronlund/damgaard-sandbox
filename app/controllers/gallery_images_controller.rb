class GalleryImagesController < ApplicationController

  
  def index
    @page = Page.find(params[:page_id])
    @breadcrumbs = { "Home" => root_path, 
                      'Admin' => admin_index_path, 
                      @page.company.title.capitalize => admin_company_path(@page.company),
                      @page.title => company_menu_pages_path(@page.menu.company, @page.menu) }

  end
  def show
    @gallery_image = GalleryImage.find(params[:id])
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    
  end

  def edit
    @gallery_image = GalleryImage.find(params[:id])
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
      
  end
  
  def new
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    @gallery_image = GalleryImage.new
    @page = Page.find(params[:page_id])
  end
  
#  def create
#    create! { page_gallery_images_path(@gallery_image.page)}
#  end

  def create
    #GalleryImage.new(gallery_image_params)
    @page = Page.find(params[:page_id])
    @gallery_image = @page.gallery_images.new(gallery_image_params)
    @gallery_image.save

    if params[:gallery_image][:image]
      redirect_to crop_gallery_image_path(@gallery_image), :notice => "gallery image created!"
    else
      redirect_to gallery_image_path(@gallery_image), :notice => "gallery image created!"
    end
    
    #create! do |success, failure|
    #  success.html do
    #    if params[:gallery_image][:image]
    #      redirect_to crop_gallery_image_path(@gallery_image), :notice => "gallery image created!"
    #    else
    #      redirect_to gallery_image_path(@gallery_image), :notice => "gallery image created!"
    #    end
    #  end
    #  #flash.error = "You are fuckd!"
    #  failure.html { render 'new' }
    #end
  end
  
  def update
    if params[:gallery_image][:image] && params[:gallery_image][:remove_image] != '1'
      redirect_to crop_gallery_image_path 
    else
      redirect_to page_gallery_images_path( @gallery_image.page) 
    end
  end
  
  def crop
    @gallery_image             = GalleryImage.find(params[:id])
    @crop_version = (params[:version] || :large).to_sym
    @gallery_image.get_crop_version! @crop_version
    @version_geometry_width, @version_geometry_height = GalleryUploader.version_dimensions[@crop_version]
    #redirect_to admin_index_path
     render :layout => 'cropper'
  end
  
  def crop_update
    @gallery_image               = GalleryImage.find(params[:id])
    @gallery_image.crop_x        = params[:gallery_image]["crop_x"]
    @gallery_image.crop_y        = params[:gallery_image]["crop_y"]
    @gallery_image.crop_h        = params[:gallery_image]["crop_h"]
    @gallery_image.crop_w        = params[:gallery_image]["crop_w"]
    @gallery_image.crop_version  = params[:gallery_image]["crop_version"]
    @gallery_image.save
    
    redirect_to page_gallery_images_path(@gallery_image.page)
  end
  
  def destroy
    @gallery_image             = GalleryImage.find(params[:id])
    @gallery_image.delete
    go_to =  page_gallery_images_path( @gallery_image.page)  
    @gallery_image.delete
    redirect_to go_to
    #destroy! { admin_index_path}
  end
  
  def sort
    params[:gallery_image].each_with_index do |id, index|
      GalleryImage.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
  
  private
    def gallery_image_params
      #if can_edit?
        params.require(:gallery_image).permit!
      #end
    end
end
