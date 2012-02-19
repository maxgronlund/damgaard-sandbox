class PagesController < InheritedResources::Base
  
  belongs_to :company , :optional => true
  
  def create
    create! {}
  end
  
end
