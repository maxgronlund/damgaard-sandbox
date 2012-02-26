class AddBoogleMapToCompanu < ActiveRecord::Migration
  def change
    add_column :companies, :google_map, :text

  end
end
