class AddEnNoToPages < ActiveRecord::Migration
  def change
    add_column :pages, :title_no, :string, default: ''
    add_column :pages, :body_no, :text, default: ''
    add_column :pages, :title_se, :string, default: ''
    add_column :pages, :body_se, :text, default: ''
    
    add_column :companies, :title_no, :string, default: ''
    add_column :companies, :body_no, :text, default: ''
    add_column :companies, :title_se, :string, default: ''
    add_column :companies, :body_se, :text, default: ''
    add_column :companies, :headline_no, :string, default: ''
    add_column :companies, :headline_se, :string, default: ''
    
    
    
    add_column :menus, :title_se, :string, default: ''
    add_column :menus, :title_no, :string, default: ''
    
  end
end
