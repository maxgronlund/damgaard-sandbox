class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title

      t.timestamps
    end
  end
end
