class Menu < ActiveRecord::Base
  belongs_to :company
  has_many :pages, :dependent => :destroy
  validates_presence_of :title, :title_uk, :title_de
end
