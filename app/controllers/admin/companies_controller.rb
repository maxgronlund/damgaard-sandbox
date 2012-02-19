class Admin::CompaniesController < InheritedResources::Base
  
  def show
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    @pages = Page.all
    show!
  end

  def edit
    @company    = Company.find(params[:id])
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path, @company.title => admin_company_path(@company) }
    session[:go_to_after_edit] = root_path
    edit!
  end
  
  def new
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    new!
  end
  
  
  def create
    create! do |success, failure|
      success.html do
        if params[:company][:image]
          redirect_to crop_company_path(@company), :notice => "company created!"
          session[:go_to_after_edit] = admin_index_path
        else
          if mobile_device?
            redirect_to company_url
          else
            redirect_to company_path(@company), :notice => "company created!"
          end
        end
      end
      #flash.error = "You are fuckd!"
      failure.html { render 'new' }
    end
  end
  
#  def update
#    if params[:company][:image] && params[:company][:remove_image] != '1'
#      update! { crop_company_path(@company) }
#    else
#      update! { admin_company_path(@company) }
#    end
#  end
  
  def crop
    @company             = Company.find(params[:id])
    @crop_version = (params[:version] || :large).to_sym
    @company.get_crop_version! @crop_version
    @version_geometry_width, @version_geometry_height = PageUploader.version_dimensions[@crop_version]
    session[:go_to_after_edit] = edit_admin_company_path(@company)
  end

  def crop_update
    @company               = Company.find(params[:id])
    @company.crop_x        = params[:company]["crop_x"]
    @company.crop_y        = params[:company]["crop_y"]
    @company.crop_h        = params[:company]["crop_h"]
    @company.crop_w        = params[:company]["crop_w"]
    @company.crop_version  = params[:company]["crop_version"]
    @company.save
    
    
    redirect_to admin_company_path(@company)
  end

end
