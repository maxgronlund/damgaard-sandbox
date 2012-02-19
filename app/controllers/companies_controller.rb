class CompaniesController < InheritedResources::Base

  #layout 'frontend'
  
  def show
    @company = Company.find(params[:id])
    render :layout => 'frontend'
  end
  
  def create
    create! do |success, failure|
      success.html do
        if params[:company][:image]
          redirect_to crop_company_path(@company), :notice => "company created!"
          session[:go_to_after_edit] = admin_index_path
        else
          redirect_to admin_company_path(@company), :notice => "company created!"
        end
      end
      #flash.error = "You are fuckd!"
      failure.html { render 'new' }
    end
  end
  
  def update
    if params[:company][:image] && params[:company][:remove_image] != '1'
      update! { crop_company_path(@company) }
    else
      update! { admin_company_path(@company) }
    end
  end
  
  def crop
    redirect_to crop_admin_company_path(params[:id])
  end

  def crop_update
    redirect_to crop_update_admin_company_path(params[:id])
  end
  
  def destroy
    destroy! { admin_index_path}
  end


  def edit
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    edit!
  end
  def new
    @breadcrumbs = { "Home" => root_path, "Admin" => admin_index_path }
    new!
  end
  


end
