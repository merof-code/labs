class CreateStudentInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :student_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :year
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
