class AddBodyUkToPage < ActiveRecord::Migration
  def change
    add_column :pages, :title_uk, :string

    add_column :pages, :body_uk, :text

  end
end
