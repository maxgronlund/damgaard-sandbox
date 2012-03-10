class AddPositionToPages < ActiveRecord::Migration
  def change
    add_column :pages, :position, :integer
    
    Page.all.each do |page|
      page.position = page.id
      page.save
    end

  end
end
