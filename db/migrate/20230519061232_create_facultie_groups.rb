class CreateFacultieGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :facultie_groups do |t|
      t.references :facultie, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
