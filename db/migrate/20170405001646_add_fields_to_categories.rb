class AddFieldsToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :top, :boolean, default: false
  end
end