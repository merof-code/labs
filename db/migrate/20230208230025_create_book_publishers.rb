class CreateBookPublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :book_publishers do |t|
      t.string :cover_pic
      t.references :book_title, null: false, foreign_key: true
      t.references :Publisher, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
