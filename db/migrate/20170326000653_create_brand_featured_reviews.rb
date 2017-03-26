class CreateBrandFeaturedReviews < ActiveRecord::Migration
    def change
      create_table :brand_featured_reviews do |t|
        t.references :brand
        t.references :review
        t.timestamps
      end
  
      add_index :brand_featured_reviews, [:brand_id, :review_id], unique: true
  end
end
