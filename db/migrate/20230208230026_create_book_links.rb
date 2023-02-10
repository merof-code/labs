class CreateBookLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :book_links do |t|
      t.references :BookPublisher, null: false, foreign_key: true
      t.string :link, null: false

      t.timestamps
    end
  end
end
