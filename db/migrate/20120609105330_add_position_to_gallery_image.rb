class AddPositionToGalleryImage < ActiveRecord::Migration
  def change
    add_column :gallery_images, :position, :integer
    
    GalleryImage.all.each do |image|
      image.position = 0
      image.save
    end
  end
end
