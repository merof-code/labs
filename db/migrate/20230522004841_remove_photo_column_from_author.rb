class RemovePhotoColumnFromAuthor < ActiveRecord::Migration[7.0]
  def change
    remove_column :authors, :photo
  end
end
