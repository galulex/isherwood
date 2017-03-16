class Category < ActiveRecord::Base
    has_many :brands, through: :brand_categories
    
        has_many :review_categories
  has_many :reviews, through: :review_categories
    
    acts_as_tree order: "item_type"
    extend ActsAsTree::TreeView
end
