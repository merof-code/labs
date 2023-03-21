class CreateBorrowExtensions < ActiveRecord::Migration[7.0]
  def change
    create_table :borrow_extensions do |t|
      t.references :borrow, null: false, foreign_key: true
      t.references :extension_reason, null: false, foreign_key: true
      t.references :approver_id, references: :user, foreign_key: { to_table: :users}, null: false
      t.integer :extended_days, null: false, default: 10
      t.date :new_return_date, null: false
      t.decimal :cost, precision: 10, scale: 2, null: false, default: 0
      t.string :comments

      t.timestamps
    end
  end
end
