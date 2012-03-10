class UpdatePagePosition < ActiveRecord::Migration
  def up
    Page.all.each do |page|
      page.position = page.id
      page.save
    end
  end

  def down
  end
end
