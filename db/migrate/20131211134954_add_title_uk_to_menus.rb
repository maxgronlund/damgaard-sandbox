class AddTitleUkToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :title_uk, :string
  end
end
