class Backdrop < ActiveRecord::Base
  

  validates_presence_of :title
  has_many :pages
  has_many :companies
  serialize :crop_params, Hash
  mount_uploader :image, PageUploader
  include ImageCrop

end
