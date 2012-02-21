class AddMenuIdToPage < ActiveRecord::Migration
  def change
    add_column :pages, :menu_id, :integer
    add_index :pages, :menu_id

  end
end
