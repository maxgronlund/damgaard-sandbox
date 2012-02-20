class GalleryImagesController < InheritedResources::Base
  belongs_to :page , :optional => true
end
