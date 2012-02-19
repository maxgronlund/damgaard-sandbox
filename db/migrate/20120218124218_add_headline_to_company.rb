class AddHeadlineToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :headline, :string

  end
end
