class ChangePhotoFields < ActiveRecord::Migration
  def change
      rename_column :photos, :image_data, :file_name
      remove_column :photos, :album_id
  end
end
