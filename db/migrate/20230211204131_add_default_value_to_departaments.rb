class AddDefaultValueToDepartaments < ActiveRecord::Migration[7.0]
  def change
    change_column_default :departments, :department_id, 0
  end
end
