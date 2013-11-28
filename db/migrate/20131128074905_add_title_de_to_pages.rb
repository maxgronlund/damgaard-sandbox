class AddTitleDeToPages < ActiveRecord::Migration
  def change
    add_column :pages, :title_de, :string
    add_column :pages, :body_de, :text
    add_column :companies, :title_de, :string
    add_column :companies, :headline_de, :string
    add_column :companies, :body_de, :text
    add_column :menus, :title_de, :string
    
    Page.all.each do |page|
      page.title_de = page.title
      page.body_de  = page.body
      page.save!
    end
    
    Company.all.each do |company|
      company.title_de    = company.title
      company.headline_de = company.headline
      company.body_de     = company.body
      company.save!
    end
    
    Menu.all.each do |menu|
      menu.title_de = menu.title
      menu.save!
    end
  end
end
