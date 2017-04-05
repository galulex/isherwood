class ExploreController < ApplicationController

def index
    @categories = Category.all
    @top_categories = Category.where(top: true)
    @makeup = Category.where(parent_id: [1001, 1002, 1003, 1004, 1005])
    @skincare = Category.where(parent_id: [2002, 2003, 2004, 2005, 2006])
end

end
