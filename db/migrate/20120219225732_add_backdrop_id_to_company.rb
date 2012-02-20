class AddBackdropIdToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :backdrop_id, :integer
    remove_column :companies, :crop_params
    remove_column :companies, :image
  end
end
