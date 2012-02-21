class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.string :title_uk
      t.belongs_to :company

      t.timestamps
    end
    add_index :menus, :company_id
  end
end
