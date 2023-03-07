class RemoveDepartamentsTemp < ActiveRecord::Migration[7.0]
  def change
    remove_column :departments, :department_id
  end
end
