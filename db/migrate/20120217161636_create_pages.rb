class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.belongs_to :company

      t.timestamps
    end
    add_index :pages, :company_id
  end
end
