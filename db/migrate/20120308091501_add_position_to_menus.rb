class AddPositionToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :position, :integer
    
    Menu.all do |menu|
      menu.position = menu.id
      menu.save
    end

  end
end
