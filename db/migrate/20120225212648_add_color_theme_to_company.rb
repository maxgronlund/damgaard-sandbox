class AddColorThemeToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :color_theme, :string

  end
end
