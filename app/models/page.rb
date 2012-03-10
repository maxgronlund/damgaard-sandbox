class Page < ActiveRecord::Base
  belongs_to :company
  has_many   :gallery_images
  belongs_to :backdrop
  belongs_to :menu
  
#  extend FriendlyId
#  friendly_id :title, :use => :slugged
  
  PAGETYPES = %w[gallery map contacts video]
  
end
