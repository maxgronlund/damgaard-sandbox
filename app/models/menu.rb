class Menu < ActiveRecord::Base
  belongs_to :company
  has_many :pages
  validates_presence_of :title, :title_uk
end
