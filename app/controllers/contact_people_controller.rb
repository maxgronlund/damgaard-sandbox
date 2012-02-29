class ContactPeopleController < InheritedResources::Base
  
  def create
    create! {admin_index_path}
  end
  
  def update
    update! {admin_index_path}
  end
  
  def destroy
    destroy! {admin_index_path}
  end
  
end
