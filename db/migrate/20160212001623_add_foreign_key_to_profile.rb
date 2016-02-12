class AddForeignKeyToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :user_id, :integer, null: false
    add_index :profiles, :user_id, unique: true
  end
end
