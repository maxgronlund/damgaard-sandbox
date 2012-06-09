class GalleryImagesController < InheritedResources::Base
  belongs_to :page , :optional => true
  
  def index
    @page = Page.find(params[:page_id])
    @breadcrumbs = { "Home" => root_path, 
                      'Admin' => admin_index_path, 
                      @page.company.title.capitalize => admin_company_path(@page.company),
                      @page.title => company_menu_pages_path(@page.menu.company, @page.menu) }
    index!
  end
  def show
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    show!
  end

  def edit
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    edit!
  end
  
  def new
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    new!
  end
  
#  def create
#    create! { page_gallery_images_path(@gallery_image.page)}
#  end

  def create
    create! do |success, failure|
      success.html do
        if params[:gallery_image][:image]
          redirect_to crop_gallery_image_path(@gallery_image), :notice => "gallery image created!"
        else
          redirect_to gallery_image_path(@gallery_image), :notice => "gallery image created!"
        end
      end
      #flash.error = "You are fuckd!"
      failure.html { render 'new' }
    end
  end
  
  def update
    if params[:gallery_image][:image] && params[:gallery_image][:remove_image] != '1'
      update! { crop_gallery_image_path }
    else
      update! { page_gallery_images_path( @gallery_image.page) }
    end
  end
  
  def crop
    @gallery_image             = GalleryImage.find(params[:id])
    @crop_version = (params[:version] || :large).to_sym
    @gallery_image.get_crop_version! @crop_version
    @version_geometry_width, @version_geometry_height = GalleryUploader.version_dimensions[@crop_version]
    #redirect_to admin_index_path
  
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
    destroy! { admin_index_path}
  end
  
  def sort
    params[:gallery_image].each_with_index do |id, index|
      GalleryImage.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

end
