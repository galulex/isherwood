class AddFieldsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :top, :boolean, default: false
    add_column :reviews, :new, :boolean, default: false
    add_column :reviews, :favorite, :boolean, default: false
  end
end
