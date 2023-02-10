class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :nickname, limit: 30
      t.string :pfp
      t.string :email, null: false
      t.string :phone_number, limit: 10
      t.string :first_name, limit: 15, null: false
      t.string :last_name, limit: 15, null: false
      t.string :middle_name, limit: 15, null: false
      t.references :role, null: false, foreign_key: true, null: false
      t.references :department, null: false, foreign_key: true, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date

      t.timestamps
    end
    add_index :users, :nickname, unique: true
    add_index :users, :email
  end
end
