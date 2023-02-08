class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.references :user, null: false, foreign_key: true
      t.string :photo
      t.string :issuer_id
      t.boolean :active
      t.string :lost
      t.datetime :issue_date
      t.date :end_date

      t.timestamps
    end
  end
end
