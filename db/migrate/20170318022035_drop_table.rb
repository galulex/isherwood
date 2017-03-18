class DropTable < ActiveRecord::Migration
  def change
    drop_table :review_categories
  end
end
