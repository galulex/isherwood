class ExploreController < ApplicationController

def index
    @categories = Category.all
    featured_category_ids = [23,14,17,9,32,21]
    @featured_categories = Category.find(featured_category_ids)
    
    @makeup = Category.where(parent_id: [1001, 1002, 1003, 1004, 1005])
    @skincare = Category.where(parent_id: [2002, 2003, 2004, 2005, 2006])
end

end
