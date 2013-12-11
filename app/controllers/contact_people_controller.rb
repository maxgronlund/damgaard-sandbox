class ContactPeopleController < ApplicationController
  before_filter :admin_only
  
  def index
    
  end
  
  def new
    @company = Company.find(params[:company_id])
    @contact_person = @company.contact_people.new
    @breadcrumbs = { "Home" => root_path, 'Admin' => admin_index_path, @company.title.capitalize => admin_company_path(@company.id) }
    
  end
  
  def edit
    @contact_person    = ContactPerson.find(params[:id])
    @breadcrumbs = { "Home" => root_path, 'Admin' => admin_index_path, @contact_person.company.title.capitalize => admin_company_path(@contact_person.company) }
      
  end
  
  def update
    #update! { admin_company_path( @contact_people.company)}
    @contact_person    = ContactPerson.find(params[:id])
   
    @contact_person.update_attributes(contact_person_params)
    if params[:contact_person][:image] && params[:contact_person][:remove_image] != '1'
      redirect_to crop_company_contact_person_path  @contact_person.company, @contact_person
    else
      redirect_to admin_company_path( @contact_person.company) 
    end
  end
  
  def create
    @company = Company.find(params[:company_id])
    @contact_person = @company.contact_people.new(contact_person_params)
    if @contact_person.save!
        if params[:contact_person][:image]
          redirect_to crop_company_contact_person_path(@company, @contact_person), :notice => "Contact person created!"
        else
          redirect_to admin_company_path( @company), :notice => "Contact person created!"
        end
      else
      #flash.error = "You are fuckd!"
      failure.html { render 'new' }
    end
  end
  
  #def update
  #  if params[:contact_people][:image] && params[:contact_people][:remove_image] != '1'
  #    update! { crop_company_contact_people_path(@contact_people.company, @contact_people) }
  #  else
  #    update! { admin_company_path( @contact_people.company) }
  #  end
  #end
  
  def crop
    @contact_person   = ContactPerson.find(params[:id])
    @crop_version = (params[:version] || :large).to_sym
    @contact_person.get_crop_version! @crop_version
    @version_geometry_width, @version_geometry_height = AvatarUploader.version_dimensions[@crop_version]
    #redirect_to admin_index_path
    render :layout => 'cropper'
  
  end
  
  def crop_update
    
    @contact_people               = ContactPerson.find(params[:id])
    @contact_people.crop_x        = params[:contact_person]["crop_x"]
    @contact_people.crop_y        = params[:contact_person]["crop_y"]
    @contact_people.crop_h        = params[:contact_person]["crop_h"]
    @contact_people.crop_w        = params[:contact_person]["crop_w"]
    @contact_people.crop_version  = params[:contact_person]["crop_version"]
    @contact_people.save
    
    redirect_to admin_company_path( @contact_people.company), :notice => "Contact person created!"
  end
  
  
#  def create
#    create! { admin_company_path( @contact_people.company)}
#  end
  
  def destroy
    @contact_people    = ContactPerson.find(params[:id])
    go_to =  admin_company_path( @contact_people.company)
     
    @contact_people.destroy
    redirect_to go_to 
  end
  
  def sort
    params[:contact_person].each_with_index do |id, index|
      ContactPerson.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
  
  private
    def contact_person_params
      #if can_edit?
        params.require(:contact_person).permit!
      #end
    end
  
end
