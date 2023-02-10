class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.references :BookPublisher, null: false, foreign_key: true
      t.datetime :bought, null: false
      t.datetime :decommissioned
      t.decimal :monetary_value, precision: 10, scale: 2, null: false, default: 0
      t.string :comments

      t.timestamps
    end
  end
end
