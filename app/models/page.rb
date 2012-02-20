class Page < ActiveRecord::Base
  belongs_to :company
  has_many    :gallery_images
  belongs_to :backdrop
end
