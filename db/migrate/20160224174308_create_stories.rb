class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.integer :user_id
      t.integer :subject_id
      t.string :subject_type

      t.timestamps null: false
    end

    add_index :stories, [:subject_id, :subject_type]
    add_index :stories, :user_id
  end
end
