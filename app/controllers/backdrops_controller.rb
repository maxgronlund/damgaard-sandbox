class BackdropsController < ApplicationController
  #load_and_authorize_resource
  def show
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    @backdrop               = Backdrop.find(params[:id])
  end

  def edit
    @backdrop             = Backdrop.find(params[:id])
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    
  end
  
  def new
    @backdrop = Backdrop.new
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    
  end
  
  def create
    @backdrop = Backdrop.new(backdrop_params)
    @backdrop.save

    if params[:backdrop][:image]
      redirect_to crop_backdrop_path(@backdrop), :notice => "backdrop created!"
    else
      redirect_to backdrop_path(@backdrop), :notice => "backdrop created!"
    end
  end
  
  def update
    @backdrop             = Backdrop.find(params[:id])
    @backdrop.update_attributes(backdrop_params)
    if params[:backdrop][:image] && params[:backdrop][:remove_image] != '1'
      redirect_to crop_backdrop_path  @backdrop
    else
      redirect_to admin_index_path 
    end
  end
  
  def crop
    @backdrop             = Backdrop.find(params[:id])
    @crop_version = (params[:version] || :large).to_sym
    @backdrop.get_crop_version! @crop_version
    @version_geometry_width, @version_geometry_height = PageUploader.version_dimensions[@crop_version]
    #redirect_to admin_index_path
    render :layout => 'cropper'

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
    @backdrop               = Backdrop.find(params[:id])
    @backdrop.destroy
    redirect_to admin_index_path
  end
  
  
  private
    def backdrop_params
      #if can_edit?
        params.require(:backdrop).permit!
      #end
    end
  
  
end
