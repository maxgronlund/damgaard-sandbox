class Menu < ActiveRecord::Base
  belongs_to :company
  validates_presence_of :title, :title_uk
end
