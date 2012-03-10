class AddCompanyIdToContactPeople < ActiveRecord::Migration
  def change
    add_column :contact_people, :position, :integer
    add_column :contact_people, :company_id, :integer
    add_index :contact_people, :company_id
  end
end
