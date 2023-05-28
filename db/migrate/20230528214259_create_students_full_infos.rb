class CreateStudentsFullInfos < ActiveRecord::Migration[7.0]
  def change
    create_view :students_full_infos
  end
end
