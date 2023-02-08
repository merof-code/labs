json.extract! book_title, :id, :name, :published_at, :author_id, :created_at, :updated_at
json.url book_title_url(book_title, format: :json)
