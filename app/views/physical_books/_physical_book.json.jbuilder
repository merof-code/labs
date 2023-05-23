json.extract! physical_book, :id, :bought, :decommissioned, :monetary_value, :comments, :book_id, :created_at, :updated_at
json.url physical_book_url(physical_book, format: :json)
