class Company < ActiveRecord::Base
  has_many :pages
  has_many :menus
  belongs_to :backdrop
  
  validates_presence_of :title, :title_uk
  
  attr_accessible :image, :image_cache, :google_map,
                  :title, :title_uk, :headline, 
                  :headline_uk, :body, :body_uk, :remove_image, :street, :zip, :city, :country, :phone, :fax, :email, :publish, :backdrop_id, :color_theme
  #serialize :crop_params, Hash
  #mount_uploader :image, PageUploader
  #include ImageCrop
  
  
end
