class Category < ActiveRecord::Base
    has_many :brands, through: :brand_categories
    acts_as_tree order: "item_type"
    extend ActsAsTree::TreeView
end
