class RemoveNotNullFormDepartamentId < ActiveRecord::Migration[7.0]
  def change
    change_column_null :departments, :department_id, false
    change_column_default :departments, :department_id, nil
  end
end
