class AddPageTypeToPage < ActiveRecord::Migration
  def change
    add_column :pages, :page_type, :string
    #remove_column :pages, :show_map
    
    Page.all.each do |page|
      page.page_type = page.show_map ? 'map' : 'normal'
      page.save
    end
  end
end
