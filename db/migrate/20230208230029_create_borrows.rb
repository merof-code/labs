class CreateBorrows < ActiveRecord::Migration[7.0]
  def change
    create_table :borrows do |t|
      t.references :Book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :approver_id
      t.integer :return_inspector_id
      t.datetime :borrow_date
      t.datetime :return_date
      t.datetime :returned_at
      t.decimal :cost, precision: 10, scale: 2
      t.string :comments

      t.timestamps
    end
  end
end
