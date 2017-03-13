class DropAlbums < ActiveRecord::Migration
  def change
    remove_column :reviews, :album_id
  end
end
