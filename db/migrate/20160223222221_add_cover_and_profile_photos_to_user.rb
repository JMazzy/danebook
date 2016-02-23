class AddCoverAndProfilePhotosToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_photo_id, :integer
    add_index :users, :profile_photo_id
    add_column :users, :cover_photo_id, :integer
    add_index :users, :cover_photo_id
  end
end
