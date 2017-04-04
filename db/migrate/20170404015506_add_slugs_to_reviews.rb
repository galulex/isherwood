class AddSlugsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :slug, :string
    add_index :reviews, :slug, unique: true
  end
end
