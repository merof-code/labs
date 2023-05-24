class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.references :publisher, null: false, foreign_key: true
      t.date :published_at
      t.integer :edition
      t.string :format
      t.string :synopsis
      t.string :language
      t.string :ISBN
      t.string :genre
      t.integer :number_of_pages

      t.timestamps
    end
  end
end
