class BackdropsController < InheritedResources::Base
  
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
  
  def create
    create! do |success, failure|
      success.html do
        if params[:backdrop][:image]
          redirect_to crop_backdrop_path(@backdrop), :notice => "backdrop created!"
        else
          redirect_to backdrop_path(@backdrop), :notice => "backdrop created!"
        end
      end
      #flash.error = "You are fuckd!"
      failure.html { render 'new' }
    end
  end
  
  def update
    if params[:backdrop][:image] && params[:backdrop][:remove_image] != '1'
      update! { crop_backdrop_path }
    else
      update! { admin_index_path }
    end
  end
  
  def crop
    @backdrop             = Backdrop.find(params[:id])
    @crop_version = (params[:version] || :large).to_sym
    @backdrop.get_crop_version! @crop_version
    @version_geometry_width, @version_geometry_height = PageUploader.version_dimensions[@crop_version]
    #redirect_to admin_index_path

  end

  def crop_update
    @backdrop               = Backdrop.find(params[:id])
    @backdrop.crop_x        = params[:backdrop]["crop_x"]
    @backdrop.crop_y        = params[:backdrop]["crop_y"]
    @backdrop.crop_h        = params[:backdrop]["crop_h"]
    @backdrop.crop_w        = params[:backdrop]["crop_w"]
    @backdrop.crop_version  = params[:backdrop]["crop_version"]
    @backdrop.save
    
    redirect_to admin_index_path
  end
  
  def destroy
    destroy! { admin_index_path}
  end
  
  
  
end
