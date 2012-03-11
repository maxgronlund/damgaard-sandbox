class ContactPeopleController < InheritedResources::Base
  load_and_authorize_resource
  belongs_to :company , :optional => true
  
  def new
    @company = Company.find(params[:company_id])
    @breadcrumbs = { "Home" => root_path, 'Admin' => admin_index_path, @company.title.capitalize => admin_company_path(@company) }
    new!
  end
  
  def edit
    @breadcrumbs = { "Home" => root_path, 'Admin' => admin_index_path, @contact_person.company.title.capitalize => admin_company_path(@contact_person.company) }
    edit!
  end
  
  def update
    update! { admin_company_path( @contact_person.company)}
  end
  
  def create
    create! do |success, failure|
      success.html do
        if params[:contact_person][:image]
          redirect_to crop_company_contact_person_path(@contact_person.company, @contact_person), :notice => "Contact person created!"
        else
          redirect_to admin_company_path( @contact_person.company), :notice => "Contact person created!"
        end
      end
      #flash.error = "You are fuckd!"
      failure.html { render 'new' }
    end
  end
  
  def update
    if params[:contact_person][:image] && params[:contact_person][:remove_image] != '1'
      update! { crop_company_contact_person_path(@contact_person.company, @contact_person) }
    else
      update! { admin_company_path( @contact_person.company) }
    end
  end
  
  def crop
    @contact_person             = ContactPerson.find(params[:id])
    @crop_version = (params[:version] || :large).to_sym
    @contact_person.get_crop_version! @crop_version
    @version_geometry_width, @version_geometry_height = AvatarUploader.version_dimensions[@crop_version]
    #redirect_to admin_index_path
  
  end
  
  def crop_update
    
    @contact_person               = ContactPerson.find(params[:id])
    @contact_person.crop_x        = params[:contact_person]["crop_x"]
    @contact_person.crop_y        = params[:contact_person]["crop_y"]
    @contact_person.crop_h        = params[:contact_person]["crop_h"]
    @contact_person.crop_w        = params[:contact_person]["crop_w"]
    @contact_person.crop_version  = params[:contact_person]["crop_version"]
    @contact_person.save
    
    redirect_to admin_company_path( @contact_person.company), :notice => "Contact person created!"
  end
  
  
#  def create
#    create! { admin_company_path( @contact_person.company)}
#  end
  
  def destroy
    destroy! { admin_company_path( @contact_person.company)}
  end
  
  def sort
    params[:contact_person].each_with_index do |id, index|
      ContactPerson.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
  
end
