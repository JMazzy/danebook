class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :gender
      t.date :birthday
      t.string :school
      t.string :hometown
      t.string :currently_lives
      t.string :phone_number
      t.text :words_to_live_by
      t.text :about_me

      t.timestamps null: false
    end
  end
end
