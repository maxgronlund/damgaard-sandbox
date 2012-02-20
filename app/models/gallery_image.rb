class GalleryImage < ActiveRecord::Base
  belongs_to :page
  
  attr_accessible :image, :image_cache, :title
  serialize :crop_params, Hash
  mount_uploader :image, GalleryUploader
  include ImageCrop
  
end
