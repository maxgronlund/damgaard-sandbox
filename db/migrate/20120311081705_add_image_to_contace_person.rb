class AddImageToContacePerson < ActiveRecord::Migration
  def change
    add_column :contact_people, :image, :string
    add_column :contact_people, :crop_params, :text

  end
end
