class RemoveNotNullFormDepartamentId2 < ActiveRecord::Migration[7.0]
  def change
    change_column_null :departments, :department_id, true
  end
end
