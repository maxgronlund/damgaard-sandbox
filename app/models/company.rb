class Company < ActiveRecord::Base
  has_many :pages
  belongs_to :backdrop
  
  validates_presence_of :title, :title_uk
  
  attr_accessible :image, :image_cache, 
                  :title, :title_uk, :headline, 
                  :headline_uk, :body, :body_uk, :remove_image, :street, :zip, :city, :country, :phone, :fax, :email, :publish, :backdrop_id
  #serialize :crop_params, Hash
  #mount_uploader :image, PageUploader
  #include ImageCrop
  
  
end
