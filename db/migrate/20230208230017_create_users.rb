class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :nickname, limit: 30
      t.string :pfp
      t.string :email
      t.string :phone_number, limit: 10
      t.string :first_name, limit: 15
      t.string :last_name, limit: 15
      t.string :middle_name, limit: 15
      t.references :role, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
    add_index :users, :nickname, unique: true
    add_index :users, :email
  end
end
