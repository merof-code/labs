class CreateBookPublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :book_publishers do |t|
      t.string :cover_pic
      t.references :book, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true
      t.date :date, null: false

      t.timestamps
    end
  end
end
