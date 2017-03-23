class CategoryFeaturedReview < ActiveRecord::Base
      belongs_to :category
      belongs_to :review
end