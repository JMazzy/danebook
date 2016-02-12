class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :posts, :user_id
    add_index :users, :email
  end
end
