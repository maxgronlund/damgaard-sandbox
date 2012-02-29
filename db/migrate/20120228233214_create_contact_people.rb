class CreateContactPeople < ActiveRecord::Migration
  def change
    create_table :contact_people do |t|
      t.string :title
      t.string :name
      t.string :tlf
      t.string :email

      t.timestamps
    end
  end
end
