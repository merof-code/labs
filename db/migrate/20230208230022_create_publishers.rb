class CreatePublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :publishers do |t|
      # t.string :photo
      t.string :name, null: false
      t.string :link
      t.string :country
      t.string :address
      t.string :email
      t.string :website
      t.integer :founded_year
      t.string :description

      t.timestamps
    end
  end
end
