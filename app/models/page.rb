class Page < ActiveRecord::Base
  belongs_to :company
  has_many    :gallery_images
  belongs_to :backdrop
  belongs_to :menu
end
