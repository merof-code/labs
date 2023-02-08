class CreateBorrowExtensions < ActiveRecord::Migration[7.0]
  def change
    create_table :borrow_extensions do |t|
      t.references :Borrow, null: false, foreign_key: true
      t.references :ExtensionReason, null: false, foreign_key: true
      t.integer :approver_id
      t.integer :extended_days
      t.date :new_return_date
      t.decimal :cost, precision: 10, scale: 2

      t.timestamps
    end
  end
end
