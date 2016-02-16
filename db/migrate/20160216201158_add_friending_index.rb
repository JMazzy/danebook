class AddFriendingIndex < ActiveRecord::Migration
  def change
    add_index :friendings, [:friendee_id, :friender_id], :unique => true
  end
end
