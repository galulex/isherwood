class AddColumnToReviewCategory < ActiveRecord::Migration
  def change
    add_column :review_categories, :review_id, :integer
    add_column :review_categories, :category_id, :integer
  end
end
