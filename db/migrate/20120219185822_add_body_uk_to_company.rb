class AddBodyUkToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :title_uk, :string
    add_column :companies, :headline_uk, :string
    add_column :companies, :body_uk, :text

  end
end
