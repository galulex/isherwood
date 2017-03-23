class Category < ActiveRecord::Base
        has_many :brand_categories
    
    has_many :brands, through: :brand_categories
    has_many :reviews
    
    acts_as_tree order: "item_type"
    extend ActsAsTree::TreeView

end
