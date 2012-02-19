class Company < ActiveRecord::Base
  has_many :pages
  validates_presence_of :title
  
  attr_accessible :image, :image_cache, :title, :headline, :body, :remove_image, :street, :zip, :city, :country, :phone, :fax, :email, :publish, :image
  serialize :crop_params, Hash
  mount_uploader :image, PageUploader

  include ImageCrop
  
  
end
