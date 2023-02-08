class CreatePublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :publishers do |t|
      t.string :photo
      t.string :name
      t.string :link
      t.string :country

      t.timestamps
    end
  end
end
