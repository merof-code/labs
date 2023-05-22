class RenameBorrowsErrors < ActiveRecord::Migration[7.0]
  def change
    rename_column :borrows, :original_return_date, :scheduled_return_date
    rename_column :borrows, :approver_id_id, :approver_id
    rename_column :borrows, :return_inspector_id_id, :return_inspector_id
  end
end
