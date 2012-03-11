class ContactPerson < ActiveRecord::Base
  belongs_to :company
  
  # Avatar image
  attr_accessible :image, :image_cache, :remote_image_url, :title, :name, :tlf, :email, :company_id, :position, :created_at, :updated_at
  serialize :crop_params, Hash
  mount_uploader :image, AvatarUploader
  include ImageCrop
  
end
