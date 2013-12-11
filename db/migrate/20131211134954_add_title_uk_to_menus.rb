class AddTitleUkToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :title_de, :string
  end
end
