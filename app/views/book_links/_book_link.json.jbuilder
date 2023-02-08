json.extract! book_link, :id, :BookPublisher_id, :link, :created_at, :updated_at
json.url book_link_url(book_link, format: :json)
