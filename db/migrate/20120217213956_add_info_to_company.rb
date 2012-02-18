class AddInfoToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :street, :string
    add_column :companies, :zip, :string
    add_column :companies, :city, :string
    add_column :companies, :country, :string
    add_column :companies, :phone, :string
    add_column :companies, :fax, :string
    add_column :companies, :email, :string
    add_column :companies, :body, :text
    add_column :companies, :publish, :boolean
    add_column :companies, :image, :string
    add_column :companies, :crop_params, :text
  end
end
