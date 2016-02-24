class ProfileAndCoverPhotos < ActiveRecord::Migration
  def change
    add_column :profiles, :profile_photo_id, :integer
    add_index :profiles, :profile_photo_id
    add_column :profiles, :cover_photo_id, :integer
    add_index :profiles, :cover_photo_id

    remove_column :users, :profile_photo_id
    remove_column :users, :cover_photo_id
  end
end
