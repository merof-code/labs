class CreateBooksFullInfos < ActiveRecord::Migration[7.0]
  def change
    create_view :books_full_infos
  end
end
