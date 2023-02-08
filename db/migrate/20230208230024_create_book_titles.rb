class CreateBookTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :book_titles do |t|
      t.string :name
      t.date :published_at
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
