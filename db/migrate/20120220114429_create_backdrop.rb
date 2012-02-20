class CreateBackdrop < ActiveRecord::Migration
  create_table :backdrops do |t|
    t.string   :title
    t.string   :image
    t.text     :crop_params
  end
end
