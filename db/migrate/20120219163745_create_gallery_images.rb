class CreateGalleryImages < ActiveRecord::Migration
  def change
    drop_table :galleries_overviews
    create_table :gallery_images do |t|
      t.string :title
      t.string :image
      t.text :crop_params
      t.belongs_to :page

      t.timestamps
    end
    add_index :gallery_images, :page_id
  end
end
