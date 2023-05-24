json.extract! book, :id, :name, :Publisher_id, :edition, :published_at, :forma, :synopsis, :language, :ISBN, :genre, :number_of_pages, :created_at, :updated_at
json.url book_url(book, format: :json)
