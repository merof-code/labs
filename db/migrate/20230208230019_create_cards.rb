class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.references :user, null: false, foreign_key: true
      t.string :photo
      t.references :issuer, references: :user, foreign_key: { to_table: :users}, null: false
      t.boolean :active, true
      t.boolean :lost, false
      t.datetime :issue_date, null: false
      t.date :end_date

      t.timestamps
    end
  end
end
