class Company < ActiveRecord::Base
  #acts_as_list
  has_many :pages, :dependent => :destroy
  has_many :menus, :dependent => :destroy
  has_many :contact_people
  belongs_to :backdrop
  
  validates_presence_of :title, :title_uk, :title_no, :title_se, :title_de
  
  extend FriendlyId
  friendly_id :title, :use => :slugged
  
  #attr_accessible :image, :image_cache, :google_map,
  #                :title, :title_uk, :headline, 
  #                :headline_uk, :body, :body_uk, :remove_image, :street, :zip, :city, :country, :phone, :fax, :email, :publish, :backdrop_id, :color_theme
  #serialize :crop_params, Hash
  #mount_uploader :image, PageUploader
  #include ImageCrop
  
  
end
