class Category < ActiveRecord::Base

    extend FriendlyId
  
    friendly_id :item_type, use: :slugged
    
    has_many :brand_categories
    has_many :brands, through: :brand_categories
    has_many :reviews
    
    has_many :category_featured_reviews
    has_many :featured_reviews, through: :category_featured_reviews, source: :review
    
    acts_as_tree order: "item_type"
    extend ActsAsTree::TreeView

end
