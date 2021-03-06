class Brand < ActiveRecord::Base
    
      extend FriendlyId
      
      friendly_id :label, use: :slugged


    has_many :reviews
    has_many :brand_categories
    has_many :categories, through: :brand_categories
    
    has_many :brand_featured_reviews
    has_many :featured_reviews, through: :brand_featured_reviews, source: :review
end
