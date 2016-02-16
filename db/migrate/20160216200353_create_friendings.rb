class CreateFriendings < ActiveRecord::Migration
  def change
    create_table :friendings do |t|
      t.integer :friender_id, null: false
      t.integer :friendee_id, null: false

      t.timestamps null: false
    end
  end
end
