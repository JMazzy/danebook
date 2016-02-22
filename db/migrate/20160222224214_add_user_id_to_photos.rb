class AddUserIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :user_id, :integer, null: false

    add_index :photos, :user_id
  end
end
