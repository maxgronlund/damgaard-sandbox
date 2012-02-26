class AddShowMapToPage < ActiveRecord::Migration
  def change
    add_column :pages, :show_map, :boolean

  end
end
