class CreatePublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :publishers do |t|
      t.string :photo
      t.string :name, null: false
      t.string :link, null: false
      t.string :country

      t.timestamps
    end
  end
end
