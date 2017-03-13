class AddFieldsToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :album, foreign_key: true
  end
end
