class ContactPerson < ActiveRecord::Base
  belongs_to :company
  
  # Avatar image
  #attr_accessible :image, :image_cache, :remote_image_url, :title, :name, :tlf, :email, :company_id, :position, :remove_image
  #attr_accessible :contact_people , :title , :nam, :tlf , :email, :created_at, :updated_at, :position, :company_id, :image, :crop_params
  serialize :crop_params, Hash
  mount_uploader :image, AvatarUploader
  include ImageCrop
  
end


