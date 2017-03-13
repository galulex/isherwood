class AddReviewToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :review, index: true, foreign_key: true
  end
end
