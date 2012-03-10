class ContactPeopleController < InheritedResources::Base
  load_and_authorize_resource
  belongs_to :company , :optional => true
  

  
  def create
    create! {admin_company_path(@contact_person.company)}
  end
  
  def update
    update! {admin_company_path(@contact_person.company)}
  end
  
  def destroy
    go_to = admin_company_path(@contact_person.company)
    destroy! {go_to}
  end
  
end
