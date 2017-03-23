class CategoryFeaturedReviews < ActiveRecord::Migration
    def change
      create_table :category_featured_reviews do |t|
        t.references :category
        t.references :review
        t.timestamps
      end
  
      add_index :category_featured_reviews, [:category_id, :review_id], unique: true
  end
end
