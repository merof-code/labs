class CreateTeacherInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :teacher_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.date :admission_date
      t.references :facultie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
