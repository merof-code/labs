json.extract! book, :id, :BookPublisher_id, :bought, :decommissioned, :monetary_value, :comments, :created_at, :updated_at
json.url book_url(book, format: :json)
