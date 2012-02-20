class AddBackdropIdToPage < ActiveRecord::Migration
  def change
    add_column :pages, :backdrop_id, :integer

  end
end
