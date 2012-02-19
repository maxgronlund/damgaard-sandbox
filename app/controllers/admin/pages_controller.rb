class Admin::PagesController < InheritedResources::Base
    belongs_to :company , :optional => true
end
