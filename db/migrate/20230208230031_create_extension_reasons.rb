class CreateExtensionReasons < ActiveRecord::Migration[7.0]
  def change
    create_table :extension_reasons do |t|
      t.string :name, null: false
      t.string :description
      t.datetime :start_date, null: false
      t.datetime :end_date

      t.timestamps
    end
    add_index :extension_reasons, :name
  end
end
