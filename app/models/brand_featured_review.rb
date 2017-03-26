class BrandFeaturedReview < ActiveRecord::Base
      belongs_to :brand
      belongs_to :review
end
