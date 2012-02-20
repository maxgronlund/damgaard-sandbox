class GalleryImagesController < InheritedResources::Base
  belongs_to :page , :optional => true
  
  def create
    create! { page_gallery_images_path(@gallery_image.page)}
  end
end
