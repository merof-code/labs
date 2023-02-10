class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :photo, null: false
      t.string :first_name, limit: 15, null: false
      t.string :last_name, limit: 15, null: false
      t.string :middle_name, limit: 15, null: false
      t.date :dob
      t.date :death

      t.timestamps
    end
  end
end
