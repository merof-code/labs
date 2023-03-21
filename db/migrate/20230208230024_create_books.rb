class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.references :publisher, null: false
      t.date :published_at, null: false
      t.string :edition
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
