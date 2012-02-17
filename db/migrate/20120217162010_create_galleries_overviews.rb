class CreateGalleriesOverviews < ActiveRecord::Migration
  def change
    create_table :galleries_overviews do |t|
      t.string :title
      t.string :image
      t.text :crop_params
      t.belongs_to :page

      t.timestamps
    end
    add_index :galleries_overviews, :page_id
  end
end
