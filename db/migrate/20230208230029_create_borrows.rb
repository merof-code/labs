class CreateBorrows < ActiveRecord::Migration[7.0]
  def change
    create_table :borrows do |t|
      t.references :Book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :approver_id, references: :user, foreign_key: { to_table: :users}, null: false
      t.references :return_inspector_id, references: :user, foreign_key: { to_table: :users}, null: false
      t.datetime :borrow_date, null: false
      t.datetime :return_date, null: false
      t.datetime :returned_at
      t.decimal :cost, precision: 10, scale: 2, null: false, default: 0
      t.string :comments

      t.timestamps
    end
  end
end
